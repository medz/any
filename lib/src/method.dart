/// HTTP request method (VERB).
///
/// This type also contains constants for a number of common HTTP methods such
/// as GET, POST, etc.
///
/// Currently includes 8 variants representing the 8 methods defined in
/// [RFC 7230](https://tools.ietf.org/html/rfc7231#section-4.1), plus PATCH,
/// and an Extension variant for all extensions.
///
/// ## Example
/// ```dart
/// final get = Method.get;
/// print(get); // GET
///
/// final post = Method.post;
/// print(post); // POST
/// ```
class Method {
  /// The HTTP method string.
  final String value;

  /// Inner constructor.
  const Method._(this.value);

  /// Constructor.
  factory Method(String value) {
    final upperCasedMethod = value.toUpperCase().trim();

    return switch (upperCasedMethod) {
      'GET' => Method.get,
      'HEAD' => Method.head,
      'POST' => Method.post,
      'PUT' => Method.put,
      'DELETE' => Method.delete,
      'CONNECT' => Method.connect,
      'OPTIONS' => Method.options,
      'TRACE' => Method.trace,
      'PATCH' => Method.patch,
      String(isEmpty: final isEmpty) => switch (isEmpty) {
          true => throw ArgumentError.value(value, 'value', 'cannot be empty'),
          false => Method._(value.toLowerCase()),
        },
    };
  }

  /// The HTTP method to string.
  @override
  String toString() => value.toUpperCase();

  /// The HTTP method to hash code.
  @override
  int get hashCode => toString().hashCode;

  /// The HTTP method to equality.
  @override
  bool operator ==(Object other) => switch (other) {
        String() => value == other.toUpperCase(),
        Method(value: final otherValue) => value == otherValue,
        _ => false,
      };

  /// HTTP GET method.
  ///
  /// The GET method requests a representation of the specified resource.
  /// Requests using GET should only retrieve data.
  ///
  /// [RFC 7231, section 4.3.1](https://tools.ietf.org/html/rfc7231#section-4.3.1)
  static const get = Method._('GET');

  /// HTTP HEAD method.
  ///
  /// The HEAD method asks for a response identical to that of a GET request,
  /// but without the response body.
  ///
  /// [RFC 7231, section 4.3.2](https://tools.ietf.org/html/rfc7231#section-4.3.2)
  static const head = Method._('HEAD');

  /// HTTP POST method.
  ///
  /// The POST method is used to submit an entity to the specified resource,
  /// often causing a change in state or side effects on the server.
  ///
  /// [RFC 7231, section 4.3.3](https://tools.ietf.org/html/rfc7231#section-4.3.3)
  static const post = Method._('POST');

  /// HTTP PUT method.
  ///
  /// The PUT method replaces all current representations of the target
  /// resource with the request payload.
  ///
  /// [RFC 7231, section 4.3.4](https://tools.ietf.org/html/rfc7231#section-4.3.4)
  static const put = Method._('PUT');

  /// HTTP DELETE method.
  ///
  /// The DELETE method deletes the specified resource.
  ///
  /// [RFC 7231, section 4.3.5](https://tools.ietf.org/html/rfc7231#section-4.3.5)
  static const delete = Method._('DELETE');

  /// HTTP CONNECT method.
  ///
  /// The CONNECT method establishes a tunnel to the server identified by the
  /// target resource.
  ///
  /// [RFC 7231, section 4.3.6](https://tools.ietf.org/html/rfc7231#section-4.3.6)
  static const connect = Method._('CONNECT');

  /// HTTP OPTIONS method.
  ///
  /// The OPTIONS method is used to describe the communication options for the
  /// target resource.
  ///
  /// [RFC 7231, section 4.3.7](https://tools.ietf.org/html/rfc7231#section-4.3.7)
  static const options = Method._('OPTIONS');

  /// HTTP TRACE method.
  ///
  /// The TRACE method performs a message loop-back test along the path to the
  /// target resource.
  ///
  /// [RFC 7231, section 4.3.8](https://tools.ietf.org/html/rfc7231#section-4.3.8)
  static const trace = Method._('TRACE');

  /// HTTP PATCH method.
  ///
  /// The PATCH method is used to apply partial modifications to a resource.
  /// PATCH is neither safe nor idempotent.
  ///
  /// [RFC 5789](https://tools.ietf.org/html/rfc5789)
  static const patch = Method._('PATCH');
}
