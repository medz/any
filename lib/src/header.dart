import 'dart:convert';

/// HTTP header.
///
/// See [RFC 7230](https://tools.ietf.org/html/rfc7230#section-3.2).
///
/// ```
/// header-field   = field-name ":" OWS field-value OWS
/// field-name     = token
/// field-value    = *( field-content / obs-fold )
/// field-content  = field-vchar [ 1*( SP / HTAB ) field-vchar ]
/// field-vchar    = VCHAR / obs-text
/// obs-fold       = CRLF 1*( SP / HTAB )
/// ```
class Header {
  /// Header name.
  final String name;

  /// Header value.
  final String value;

  /// Creates a new header.
  Header({
    required this.name,
    required this.value,
  });

  /// Creates a new header from a string.
  factory Header.fromString(String line) {
    final parts = line.trimRight().split(':');

    return Header(
      name: parts[0].trim(),
      value: parts.sublist(1).join(':').trim(),
    );
  }

  /// Creates a new header from a [List<int>].
  factory Header.fromBytes(List<int> bytes) {
    return Header.fromString(ascii.decode(bytes));
  }

  /// Converts the header to [List<int>].
  List<int> toBytes() => ascii.encode(toString());

  /// Converts the header to a string.
  @override
  String toString() => '$name: $value\r\n';
}
