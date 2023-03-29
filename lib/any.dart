import 'dart:convert';
import 'dart:io';

import 'package:any/src/header.dart';
import 'package:any/src/start_line.dart';

import 'src/message.dart';

void main() async {
  final server = await ServerSocket.bind('localhost', 8080);
  print('Listening on http://localhost:${server.port}');

  await for (final socket in server) {
    socket.listen((List<int> event) {
      final request = Message.fromBytes(event);
      print(request.toBytes() == event);

      final response = Message(
        startLine: StatusLine(
          code: 200,
          phrase: 'ok',
          version: (request.startLine as RequestLine).version,
        ),
        headers: [
          Header(
            name: 'Context-Type',
            value: 'text/plain; charset=utf-8',
          ),
        ],
        body: utf8.encode('你好！'),
      );

      socket.add(response.toBytes());
      socket.close();
    });
  }
}
