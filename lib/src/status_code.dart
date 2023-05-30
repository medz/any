/// An HTTP status code (`status-code` in RFC 7230 et al.).
///
/// Constants are provided for known status codes, including those in the IANA
/// [HTTP Status Code Registry](
/// https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml).
///
/// Status code values in the range 100-999 (inclusive) are supported by this
/// type. Values in the range 100-599 are semantically classified by the most
/// significant digit. See [`StatusCode::is_success`], etc. Values above 599
/// are unclassified but allowed for legacy compatibility, though their use is
/// discouraged. Applications may interpret such values as protocol errors.
///
/// ## Example
/// ```dart
/// final ok = StatusCode.ok;
/// print(ok); // 200 OK
///
/// final custom = StatusCode(299, 'Custom status code');
/// print(custom); // 299 Custom status code
/// ```
class StatusCode {
  /// Status code value
  final int value;

  /// Status code reason phrase
  final String reasonPhrase;

  /// Creates a new status code.
  const StatusCode(this.value, this.reasonPhrase);

  /// The status code to string.
  @override
  String toString() => '$value $reasonPhrase';

  /// 100 Continue
  ///
  /// [RFC7231, Section 6.2.1](https://tools.ietf.org/html/rfc7231#section-6.2.1)
  static const continue_ = StatusCode(100, 'Continue');

  /// 101 Switching Protocols
  ///
  /// [RFC7231, Section 6.2.2](https://tools.ietf.org/html/rfc7231#section-6.2.2)
  static const switchingProtocols = StatusCode(101, 'Switching Protocols');

  /// 102 Processing
  ///
  /// [RFC2518](https://tools.ietf.org/html/rfc2518)
  static const processing = StatusCode(102, 'Processing');

  /// 200 OK
  ///
  /// [RFC7231, Section 6.3.1](https://tools.ietf.org/html/rfc7231#section-6.3.1)
  static const ok = StatusCode(200, 'OK');

  /// 201 Created
  ///
  /// [RFC7231, Section 6.3.2](https://tools.ietf.org/html/rfc7231#section-6.3.2)
  static const created = StatusCode(201, 'Created');

  /// 202 Accepted
  ///
  /// [RFC7231, Section 6.3.3](https://tools.ietf.org/html/rfc7231#section-6.3.3)
  static const accepted = StatusCode(202, 'Accepted');

  /// 203 Non-Authoritative Information
  ///
  /// [RFC7231, Section 6.3.4](https://tools.ietf.org/html/rfc7231#section-6.3.4)
  static const nonAuthoritativeInformation =
      StatusCode(203, 'Non-Authoritative Information');

  /// 204 No Content
  ///
  /// [RFC7231, Section 6.3.5](https://tools.ietf.org/html/rfc7231#section-6.3.5)
  static const noContent = StatusCode(204, 'No Content');

  /// 205 Reset Content
  ///
  /// [RFC7231, Section 6.3.6](https://tools.ietf.org/html/rfc7231#section-6.3.6)
  static const resetContent = StatusCode(205, 'Reset Content');

  /// 206 Partial Content
  ///
  /// [RFC7233, Section 4.1](https://tools.ietf.org/html/rfc7233#section-4.1)
  static const partialContent = StatusCode(206, 'Partial Content');

  /// 207 Multi-Status
  ///
  /// [RFC4918](https://tools.ietf.org/html/rfc4918)
  static const multiStatus = StatusCode(207, 'Multi-Status');

  /// 208 Already Reported
  ///
  /// [RFC5842](https://tools.ietf.org/html/rfc5842)
  static const alreadyReported = StatusCode(208, 'Already Reported');

  /// 226 IM Used
  ///
  /// [RFC3229](https://tools.ietf.org/html/rfc3229)
  static const imUsed = StatusCode(226, 'IM Used');

  /// 300 Multiple Choices
  ///
  /// [RFC7231, Section 6.4.1](https://tools.ietf.org/html/rfc7231#section-6.4.1)
  static const multipleChoices = StatusCode(300, 'Multiple Choices');

  /// 301 Moved Permanently
  ///
  /// [RFC7231, Section 6.4.2](https://tools.ietf.org/html/rfc7231#section-6.4.2)
  static const movedPermanently = StatusCode(301, 'Moved Permanently');

  /// 302 Found
  ///
  /// [RFC7231, Section 6.4.3](https://tools.ietf.org/html/rfc7231#section-6.4.3)
  static const found = StatusCode(302, 'Found');

  /// 303 See Other
  ///
  /// [RFC7231, Section 6.4.4](https://tools.ietf.org/html/rfc7231#section-6.4.4)
  static const seeOther = StatusCode(303, 'See Other');

  /// 304 Not Modified
  ///
  /// [RFC7232, Section 4.1](https://tools.ietf.org/html/rfc7232#section-4.1)
  static const notModified = StatusCode(304, 'Not Modified');

  /// 305 Use Proxy
  ///
  /// [RFC7231, Section 6.4.5](https://tools.ietf.org/html/rfc7231#section-6.4.5)
  static const useProxy = StatusCode(305, 'Use Proxy');

  /// 307 Temporary Redirect
  ///
  /// [RFC7231, Section 6.4.7](https://tools.ietf.org/html/rfc7231#section-6.4.7)
  static const temporaryRedirect = StatusCode(307, 'Temporary Redirect');

  /// 308 Permanent Redirect
  ///
  /// [RFC7538](https://tools.ietf.org/html/rfc7538)
  static const permanentRedirect = StatusCode(308, 'Permanent Redirect');

  /// 400 Bad Request
  ///
  /// [RFC7231, Section 6.5.1](https://tools.ietf.org/html/rfc7231#section-6.5.1)
  static const badRequest = StatusCode(400, 'Bad Request');

  /// 401 Unauthorized
  ///
  /// [RFC7235, Section 3.1](https://tools.ietf.org/html/rfc7235#section-3.1)
  static const unauthorized = StatusCode(401, 'Unauthorized');

  /// 402 Payment Required
  ///
  /// [RFC7231, Section 6.5.2](https://tools.ietf.org/html/rfc7231#section-6.5.2)
  static const paymentRequired = StatusCode(402, 'Payment Required');

  /// 403 Forbidden
  ///
  /// [RFC7231, Section 6.5.3](https://tools.ietf.org/html/rfc7231#section-6.5.3)
  static const forbidden = StatusCode(403, 'Forbidden');

  /// 404 Not Found
  ///
  /// [RFC7231, Section 6.5.4](https://tools.ietf.org/html/rfc7231#section-6.5.4)
  static const notFound = StatusCode(404, 'Not Found');

  /// 405 Method Not Allowed
  ///
  /// [RFC7231, Section 6.5.5](https://tools.ietf.org/html/rfc7231#section-6.5.5)
  static const methodNotAllowed = StatusCode(405, 'Method Not Allowed');

  /// 406 Not Acceptable
  ///
  /// [RFC7231, Section 6.5.6](https://tools.ietf.org/html/rfc7231#section-6.5.6)
  static const notAcceptable = StatusCode(406, 'Not Acceptable');

  /// 407 Proxy Authentication Required
  ///
  /// [RFC7235, Section 3.2](https://tools.ietf.org/html/rfc7235#section-3.2)
  static const proxyAuthenticationRequired =
      StatusCode(407, 'Proxy Authentication Required');

  /// 408 Request Timeout
  ///
  /// [RFC7231, Section 6.5.7](https://tools.ietf.org/html/rfc7231#section-6.5.7)
  static const requestTimeout = StatusCode(408, 'Request Timeout');

  /// 409 Conflict
  ///
  /// [RFC7231, Section 6.5.8](https://tools.ietf.org/html/rfc7231#section-6.5.8)
  static const conflict = StatusCode(409, 'Conflict');

  /// 410 Gone
  ///
  /// [RFC7231, Section 6.5.9](https://tools.ietf.org/html/rfc7231#section-6.5.9)
  static const gone = StatusCode(410, 'Gone');

  /// 411 Length Required
  ///
  /// [RFC7231, Section 6.5.10](https://tools.ietf.org/html/rfc7231#section-6.5.10)
  static const lengthRequired = StatusCode(411, 'Length Required');

  /// 412 Precondition Failed
  ///
  /// [RFC7232, Section 4.2](https://tools.ietf.org/html/rfc7232#section-4.2)
  static const preconditionFailed = StatusCode(412, 'Precondition Failed');

  /// 413 Payload Too Large
  ///
  /// [RFC7231, Section 6.5.11](https://tools.ietf.org/html/rfc7231#section-6.5.11)
  static const payloadTooLarge = StatusCode(413, 'Payload Too Large');

  /// 414 URI Too Long
  ///
  /// [RFC7231, Section 6.5.12](https://tools.ietf.org/html/rfc7231#section-6.5.12)
  static const uriTooLong = StatusCode(414, 'URI Too Long');

  /// 415 Unsupported Media Type
  ///
  /// [RFC7231, Section 6.5.13](https://tools.ietf.org/html/rfc7231#section-6.5.13)
  static const unsupportedMediaType = StatusCode(415, 'Unsupported Media Type');

  /// 416 Range Not Satisfiable
  ///
  /// [RFC7233, Section 4.4](https://tools.ietf.org/html/rfc7233#section-4.4)
  static const rangeNotSatisfiable = StatusCode(416, 'Range Not Satisfiable');

  /// 417 Expectation Failed
  ///
  /// [RFC7231, Section 6.5.14](https://tools.ietf.org/html/rfc7231#section-6.5.14)
  static const expectationFailed = StatusCode(417, 'Expectation Failed');

  /// 418 I'm a teapot
  ///
  /// [RFC2324](https://tools.ietf.org/html/rfc2324)
  static const imATeapot = StatusCode(418, 'I\'m a teapot');

  /// 421 Misdirected Request
  ///
  /// [RFC7540, Section 9.1.2](https://tools.ietf.org/html/rfc7540#section-9.1.2)
  static const misdirectedRequest = StatusCode(421, 'Misdirected Request');

  /// 422 Unprocessable Entity
  ///
  /// [RFC4918](https://tools.ietf.org/html/rfc4918)
  static const unprocessableEntity = StatusCode(422, 'Unprocessable Entity');

  /// 423 Locked
  ///
  /// [RFC4918](https://tools.ietf.org/html/rfc4918)
  static const locked = StatusCode(423, 'Locked');

  /// 424 Failed Dependency
  ///
  /// [RFC4918](https://tools.ietf.org/html/rfc4918)
  static const failedDependency = StatusCode(424, 'Failed Dependency');

  /// 426 Upgrade Required
  ///
  /// [RFC7231, Section 6.5.15](https://tools.ietf.org/html/rfc7231#section-6.5.15)
  static const upgradeRequired = StatusCode(426, 'Upgrade Required');

  /// 428 Precondition Required
  ///
  /// [RFC6585](https://tools.ietf.org/html/rfc6585)
  static const preconditionRequired = StatusCode(428, 'Precondition Required');

  /// 429 Too Many Requests
  ///
  /// [RFC6585](https://tools.ietf.org/html/rfc6585)
  static const tooManyRequests = StatusCode(429, 'Too Many Requests');

  /// 431 Request Header Fields Too Large
  ///
  /// [RFC6585](https://tools.ietf.org/html/rfc6585)
  static const requestHeaderFieldsTooLarge =
      StatusCode(431, 'Request Header Fields Too Large');

  /// 451 Unavailable For Legal Reasons
  ///
  /// [RFC7725](https://tools.ietf.org/html/rfc7725)
  static const unavailableForLegalReasons =
      StatusCode(451, 'Unavailable For Legal Reasons');

  /// 500 Internal Server Error
  ///
  /// [RFC7231, Section 6.6.1](https://tools.ietf.org/html/rfc7231#section-6.6.1)
  static const internalServerError = StatusCode(500, 'Internal Server Error');

  /// 501 Not Implemented
  ///
  /// [RFC7231, Section 6.6.2](https://tools.ietf.org/html/rfc7231#section-6.6.2)
  static const notImplemented = StatusCode(501, 'Not Implemented');

  /// 502 Bad Gateway
  ///
  /// [RFC7231, Section 6.6.3](https://tools.ietf.org/html/rfc7231#section-6.6.3)
  static const badGateway = StatusCode(502, 'Bad Gateway');

  /// 503 Service Unavailable
  ///
  /// [RFC7231, Section 6.6.4](https://tools.ietf.org/html/rfc7231#section-6.6.4)
  static const serviceUnavailable = StatusCode(503, 'Service Unavailable');

  /// 504 Gateway Timeout
  ///
  /// [RFC7231, Section 6.6.5](https://tools.ietf.org/html/rfc7231#section-6.6.5)
  static const gatewayTimeout = StatusCode(504, 'Gateway Timeout');

  /// 505 HTTP Version Not Supported
  ///
  /// [RFC7231, Section 6.6.6](https://tools.ietf.org/html/rfc7231#section-6.6.6)
  static const httpVersionNotSupported =
      StatusCode(505, 'HTTP Version Not Supported');

  /// 506 Variant Also Negotiates
  ///
  /// [RFC2295](https://tools.ietf.org/html/rfc2295)
  static const variantAlsoNegotiates =
      StatusCode(506, 'Variant Also Negotiates');

  /// 507 Insufficient Storage
  ///
  /// [RFC4918](https://tools.ietf.org/html/rfc4918)
  static const insufficientStorage = StatusCode(507, 'Insufficient Storage');

  /// 508 Loop Detected
  ///
  /// [RFC5842](https://tools.ietf.org/html/rfc5842)
  static const loopDetected = StatusCode(508, 'Loop Detected');

  /// 510 Not Extended
  ///
  /// [RFC2774](https://tools.ietf.org/html/rfc2774)
  static const notExtended = StatusCode(510, 'Not Extended');

  /// 511 Network Authentication Required
  ///
  /// [RFC6585](https://tools.ietf.org/html/rfc6585)
  static const networkAuthenticationRequired =
      StatusCode(511, 'Network Authentication Required');
}
