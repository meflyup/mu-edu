import 'dart:io';
import 'dart:async';

handleMsg(msg) {
  print('Message received: $msg');
}

main() {
  runZoned(() async {
    var server = await HttpServer.bind('127.0.0.1', 4040);
    await for (var req in server) {
      if (req.uri.path == '/ws') {
        // Upgrade a HttpRequest to a WebSocket connection.
        var socket = await WebSocketTransformer.upgrade(req);
        socket.listen(handleMsg);

      };
    }
  },
  onError: (e) => print("An error occurred."));
}