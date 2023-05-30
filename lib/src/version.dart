/// HTTP version
///
/// This module defines a few HTTP versions that are used in the library.
///
/// ## Example
/// ```dart
/// final http11 = Version.http11;
///
/// print(http11); // HTTP/1.1
/// ```
enum Version {
  /// HTTP/0.9
  http09('HTTP/0.9'),

  /// HTTP/1.0
  http10('HTTP/1.0'),

  /// HTTP/1.1
  http11('HTTP/1.1'),

  /// HTTP/2.0
  http20('HTTP/2.0'),

  /// HTTP/3.0
  http30('HTTP/3.0');

  /// HTTP version string
  final String value;

  /// Inner constructor
  const Version(this.value);

  /// The HTTP version to string.
  @override
  String toString() => value;
}
