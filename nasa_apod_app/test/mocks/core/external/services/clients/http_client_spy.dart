import 'package:dartz/dartz.dart';
import 'package:fluttely_core/fluttely_core.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When<Future<Either<HttpFailure, dynamic>>> mockRequestCall() =>
      when(() => request(
          url: any(named: 'url'),
          method: any(named: 'method'),
          body: any(named: 'body'),
          headers: any(named: 'headers')));

  void mockRequestSuccess(dynamic data) =>
      mockRequestCall().thenAnswer((_) async => Right(data));

  void mockRequestFailure(HttpFailure error) =>
      mockRequestCall().thenAnswer((_) async => Left(error));
}
