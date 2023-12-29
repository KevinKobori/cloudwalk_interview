import 'package:dartz/dartz.dart';
import 'package:fluttely_core/fluttely_core.dart';

enum HttpVerbs {
  get,
  post,
  put,
  delete,
}

mixin HttpClient {
  Future<Either<HttpFailure, dynamic>> request({
    required String url,
    required HttpVerbs method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });
}
