enum HttpFailure {
  /// Custom
  unknownError('Unknown Error', -1),
  invalidData('Invalid Data', -2),

  /// 1xx Informative
  continueProccess('Continue', 100),
  switchingProtocols('Switching Protocols', 101),
  processing('Processing', 102),

  /// 2xx Success
  ok('OK', 200),
  created('Created', 201),
  accepted('Accepted', 202),
  nonAuthoritativeInformation('Non-authoritative Information', 203),
  noContent('No Content', 204),
  resetContent('Reset Content', 205),
  partialContent('Partial Content', 206),
  multiStatus('Multi-Status', 207),
  alreadyReported('Already Reported', 208),
  iMUsed('IM Used', 226),

  /// 3xx Redirecting
  multipleChoices('Multiple Choices', 300),
  movedPermanently('Moved Permanently', 301),
  found('Found', 302),
  seeOther('See Other', 303),
  notModified('Not Modified', 304),
  useProxy('Use Proxy', 305),
  temporaryRedirect('Temporary Redirect', 307),
  permanentRedirect('Permanent Redirect', 308),

  /// 4xx Client Error
  badRequest('Bad Request', 400),
  unauthorized('Unauthorized', 401),
  paymentRequired('Payment Required', 402),
  forbidden('Forbidden', 403),
  notFound('Not Found', 404),
  methodNotAllowed('Method Not Allowed', 405),
  notAcceptable('Not Acceptable', 406),
  proxyAuthenticationRequired('Proxy Authentication Required', 407),
  requestTimeout('Request Timeout', 408),
  conflict('Conflict', 409),
  gone('Gone', 410),
  lengthRequired('Length Required', 411),
  preconditionFailed('Precondition Failed', 412),
  payloadTooLarge('Payload Too Large', 413),
  requestURITooLong('Request-URI Too Long', 414),
  unsupportedMediaType('Unsupported Media Type', 415),
  requestedRangeNotSatisfiable('Requested Range Not Satisfiable', 416),
  expectationFailed('Expectation Failed', 417),
  iamATeapot('I\'m a teapot', 418),
  misdirectedRequest('Misdirected Request', 421),
  unprocessableEntity('Unprocessable Entity', 422),
  locked('Locked', 423),
  failedDependency('Failed Dependency', 424),
  upgradeRequired('Upgrade Required', 426),
  preconditionRequired('Precondition Required', 428),
  tooManyRequests('Too Many Requests', 429),
  requestHeaderFieldsTooLarge('Request Header Fields Too Large', 431),
  connectionClosedWithoutResponse('Connection Closed Without Response', 444),
  unavailableForLegalReasons('Unavailable For Legal Reasons', 451),
  clientClosedRequest('Client Closed Request', 499),

  /// 5xx Server Error
  internalServerError('Internal Server Error', 500),
  notImplemented('Not Implemented', 501),
  badGateway('Bad Gateway', 502),
  serviceUnavailable('Service Unavailable', 503),
  gatewayTimeout('Gateway Timeout', 504),
  hTTPVersionNotSupported('HTTP Version Not Supported', 505),
  variantAlsoNegociates('Variant Also Negociates', 506),
  insufficientStorage('Insufficient Storage', 507),
  loopDetected('Loop Detected', 508),
  notExtended('Not Extended', 510),
  networkAuthenticationRequired('Network Authentication Required', 511),
  networkConnectionTimeoutError('Network Connection Timeout Error', 599);

  final String message;
  final int statusCode;

  const HttpFailure(
    this.message,
    this.statusCode,
  );

  factory HttpFailure.fromStatusCode(int statusCode) {
    try {
      return HttpFailure.values
          .firstWhere((item) => item.statusCode == statusCode);
    } catch (_) {
      return HttpFailure.unknownError;
    }
  }
}
