abstract class IHttpClient {
  Future<Map<String, dynamic>?> request({
    required String url,
    required String method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });
}
