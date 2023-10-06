import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin IHttpClient {
  Future<Either<ServerException, dynamic>> request({
    required String url,
    required String method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });
}
