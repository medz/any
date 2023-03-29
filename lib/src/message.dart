import 'dart:convert';

import 'header.dart';
import 'start_line.dart';

/// HTTP message
///
/// See [RFC 7230](https://tools.ietf.org/html/rfc7230#section-3).
///
/// ```
/// message = start-line
///          *( header-field CRLF )
///         CRLF
///        [ message-body ]
/// ```
class Message {
  /// HTTP start line.
  final StartLine startLine;

  /// HTTP headers.
  final List<Header> headers;

  /// HTTP message body.
  final List<int> body;

  /// Creates a new HTTP message.
  Message({
    required this.startLine,
    required this.headers,
    required this.body,
  });

  /// Creates a new HTTP message from a [List<int>].
  factory Message.fromBytes(List<int> bytes) {
    final lines = LineSplitter.split(ascii.decode(bytes)).toList();
    final startLine = StartLine.fromString(lines.first);
    final headers = <Header>[];
    var body = <int>[];
    var bodyStarted = false;
    for (var i = 1; i < lines.length; i++) {
      final line = lines[i];
      if (line.isEmpty) {
        bodyStarted = true;
        continue;
      }
      if (bodyStarted) {
        body.addAll(ascii.encode(line));
      } else {
        headers.add(Header.fromString(line));
      }
    }
    return Message(
      startLine: startLine,
      headers: headers,
      body: body,
    );
  }

  /// Converts the HTTP message to [List<int>].
  List<int> toBytes() => [
        ...startLine.toBytes(),
        ...headers.map((header) => header.toBytes()).expand((x) => x),
        ...ascii.encode('\r\n'),
        ...body,
      ];
}
