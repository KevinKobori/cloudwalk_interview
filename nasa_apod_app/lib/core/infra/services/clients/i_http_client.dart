import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:multiple_result/multiple_result.dart';

mixin IHttpClient {
  Future<Result<dynamic, InfraException>> request({
    required String url,
    required String method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });
}
