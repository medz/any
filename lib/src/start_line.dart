import 'dart:convert';

/// HTTP start line.
///
/// See [RFC 7230](https://tools.ietf.org/html/rfc7230#section-3.1).
///
/// ```
/// start-line = request-line / status-line
/// request-line = method SP request-target SP HTTP-version CRLF
/// status-line = HTTP-version SP status-code SP reason-phrase CRLF
/// ```
abstract class StartLine {
  /// Creates a new start line from a string.
  factory StartLine.fromString(String line) {
    if (line.startsWith('HTTP/')) {
      return StatusLine.fromString(line);
    } else {
      return RequestLine.fromString(line);
    }
  }

  /// Creates a new start line from a [List<int>].
  factory StartLine.fromBytes(List<int> bytes) {
    return StartLine.fromString(ascii.decode(bytes));
  }

  /// HTTP version.
  abstract final String version;

  /// Converts the start line to [List<int>].
  List<int> toBytes();
}

/// HTTP request line.
///
/// See [RFC 7230](https://tools.ietf.org/html/rfc7230#section-3.1.1).
///
/// ```
/// request-line = method SP request-target SP HTTP-version CRLF
/// ```
class RequestLine implements StartLine {
  /// HTTP method.
  final String method;

  /// Request target.
  final Uri target;

  /// HTTP version.
  @override
  final String version;

  /// Creates a new request line.
  RequestLine({
    required this.method,
    required this.target,
    required this.version,
  });

  /// Creates a new request line from a string.
  factory RequestLine.fromString(String line) {
    final parts = line.trimRight().split(' ');
    if (parts.length != 3) {
      throw FormatException('Invalid request line: $line');
    }

    return RequestLine(
      method: parts[0],
      target: Uri.parse(parts[1]),
      version: parts[2],
    );
  }

  /// Creates a new request line from a [List<int>].
  factory RequestLine.fromBytes(List<int> bytes) {
    return RequestLine.fromString(ascii.decode(bytes));
  }

  @override
  List<int> toBytes() => ascii.encode(toString());

  @override
  String toString() => '$method $target $version\r\n';
}

/// HTTP status line.
///
/// See [RFC 7230](https://tools.ietf.org/html/rfc7230#section-3.1.2).
///
/// ```
/// status-line = HTTP-version SP status-code SP reason-phrase CRLF
/// ```
class StatusLine implements StartLine {
  /// HTTP status code.
  final int code;

  /// HTTP reason phrase.
  final String phrase;

  /// HTTP version.
  @override
  final String version;

  /// Creates a new status line.
  StatusLine({
    required this.code,
    required this.phrase,
    required this.version,
  });

  /// Creates a new status line from a string.
  factory StatusLine.fromString(String line) {
    final parts = line.trimRight().split(' ');
    if (parts.length < 2) {
      throw FormatException('Invalid status line: $line');
    }

    return StatusLine(
      code: int.parse(parts[1].trim()),
      phrase: parts.sublist(2).map((e) => e.trim()).join(' '),
      version: parts[0].trim(),
    );
  }

  /// Creates a new status line from a [List<int>].
  factory StatusLine.fromBytes(List<int> bytes) {
    return StatusLine.fromString(ascii.decode(bytes));
  }

  @override
  List<int> toBytes() => ascii.encode(toString());

  @override
  String toString() => '$version $code $phrase\r\n';
}
