import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

import '../config/config.dart';

class Uploads {
  shelf.Response _jsonResponse(Map<String, dynamic> data) {
    return shelf.Response.ok(jsonEncode(data).toString(),
        headers: {'content-type': 'application/json'});
  }

  Router get handler {
    var router = Router();

    router.get('/<hash>/<file>',
        (shelf.Request request, String hash, String filename) {
      var directory = hash + '/' + filename.replaceAll('%20', ' ');
      var file = File('$UPLOAD_DIRECTORY/$directory');
      if (!file.existsSync()) {
        return _jsonResponse({'status': 404, 'message': 'File not found!'});
      }

      var fileStream = file.openRead();

      return shelf.Response.ok(fileStream, headers: {
        'content-type': lookupMimeType(file.path),
        'content-disposition': 'attachment; filename="$filename"'
      });
    });

    return router;
  }
}
