import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:mime/mime.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

import '../config/config.dart';

class Apis {
  shelf.Response _jsonResponse(Map<String, dynamic> data) {
    return shelf.Response.ok(jsonEncode(data).toString(),
        headers: {'content-type': 'application/json'});
  }

  shelf.Handler get handler {
    final router = Router();

    router.get('/hello', (shelf.Request request) {
      return shelf.Response.ok('Hello from File Share Server!');
    });

    router.post('/upload', (shelf.Request request) async {
      if (!request.mimeType.contains('multipart/form-data')) {
        return _jsonResponse({'status': 400, 'body': 'Form data is expected.'});
      }

      // Converts form-data body to a Map<String, dynamic>
      var body = await getBody(request);

      if (body['file'] != null && body['message'] != null) {
        // generate a hash combining file name & timestamp
        var bytes =
            utf8.encode(body['file']['filename'] + DateTime.now().toString());
        var hash = sha1.convert(bytes).toString();

        // saving file to server
        if (!Directory(UPLOAD_DIRECTORY).existsSync()) {
          await Directory(UPLOAD_DIRECTORY).create();
        }
        if (!Directory('$UPLOAD_DIRECTORY/$hash').existsSync()) {
          await Directory('$UPLOAD_DIRECTORY/$hash').create();
        }

        await File("upload/$hash/${body['file']['filename']}")
            .writeAsBytes(body['file']['content']);

        // create message file
        await File('upload/$hash/message.txt').writeAsString(body['message']);

        // set future to delete the file after [FILE_TIMEOUT_DURATION] seconds
        Future.delayed(const Duration(seconds: FILE_TIMEOUT_DURATION), () {
          Directory('$UPLOAD_DIRECTORY/$hash').deleteSync(recursive: true);
        });

        // return postive message
        return _jsonResponse({
          'status': 200,
          'message': 'File added successfully!',
          'hash': hash
        });
      } else {
        return _jsonResponse(
            {'status': 400, 'body': 'Missing required parameters.'});
      }
    });

    router.post('/download', (shelf.Request request) async {
      // Expecting JSON object
      if (request.mimeType != 'application/json') {
        return _jsonResponse({
          'status': 400,
          'message': 'Expecting JSON format but recieved ${request.mimeType}'
        });
      }

      // converts json string to map
      var body =
          jsonDecode(await request.readAsString()) as Map<String, dynamic>;

      if (body['token'] != null && body['token'] != '') {
        var hash = body['token'];

        // Checks if file exists
        if (!Directory('$UPLOAD_DIRECTORY/$hash').existsSync()) {
          return _jsonResponse({
            'status': 200,
            'message':
                'File not found! Maybe because it gets deleted after ${FILE_TIMEOUT_DURATION / 60} minutes.'
          });
        }

        // Gets all the files & message added by uploader
        var directory = Directory('$UPLOAD_DIRECTORY/$hash');
        var message = '';
        var file = '';
        directory.listSync().forEach((element) {
          var filename = element.path.split('\\')[1];
          if (filename == 'message.txt') {
            var file = File(element.path);
            message = file.readAsStringSync();
          } else {
            file = filename;
          }
        });

        return _jsonResponse({
          'status': 200,
          'message': 'Found & decrypted the file.',
          'body': {
            'message': message,
            'filename': file,
            'url':
                'http://${request.headers['host']}/${UPLOAD_DIRECTORY.split('/')[1]}/$hash/$file',
          }
        });
      } else {
        return _jsonResponse(
            {'status': 400, 'message': 'Missing required parameters.'});
      }
    });

    return router;
  }

  // Converts form-data body to a Map<String, dynamic>
  Future<Map<String, dynamic>> getBody(shelf.Request request) async {
    var body = <String, dynamic>{};

    var dataBytes = <int>[];

    // Reading all dataBytes from stream
    await for (var data in request.read()) {
      dataBytes.addAll(data);
    }

    // Get the attached parameters like filename, fieldname from content-type's boundary
    var boundary = request.headers['content-type'];
    boundary = boundary.split('=')[1];

    final transformer = MimeMultipartTransformer(boundary);
    final bodyStream = Stream.fromIterable([dataBytes]);
    final parts = await transformer.bind(bodyStream).toList();

    // Loops through all the form-data parts including files & other fields
    for (var part in parts) {
      final contentDisposition = part.headers['content-disposition'];
      final filename =
          RegExp(r'filename="([^"]*)"').firstMatch(contentDisposition);

      final content = await part.toList();

      if (filename == null) {
        var value = utf8.decode(content[0]);
        final fieldname =
            RegExp(r'name="([^"]*)"').firstMatch(contentDisposition);
        body[fieldname.group(1)] = value;
      } else {
        body['file'] = {'filename': filename.group(1), 'content': content[0]};
      }
    }
    return body;
  }
}
