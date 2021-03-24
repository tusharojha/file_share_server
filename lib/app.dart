import 'dart:io';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

import 'config/config.dart';
import 'handlers/api_handler.dart';
import 'handlers/uploads_handler.dart';
import './static/home.html.dart';

class App {
  shelf.Handler get handler {
    final router = Router();

    router.mount('/api/', Apis().handler);
    router.mount('/${UPLOAD_DIRECTORY.split('/')[1]}/', Uploads().handler);

    router.get('/<name|.*>', (shelf.Request request) {
      return shelf.Response.ok(homeHTML, headers: {'content-type': ContentType.html.toString()});
    });

    return router;
  }
}
