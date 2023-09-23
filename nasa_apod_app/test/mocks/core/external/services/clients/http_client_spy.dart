import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class HttpClientSpy extends Mock implements IHttpClient {
  When<Future<Either<InfraException, dynamic>>> mockRequestCall() =>
      when(() => request(
          url: any(named: 'url'),
          method: any(named: 'method'),
          body: any(named: 'body'),
          headers: any(named: 'headers')));

  void mockRequestSuccess(dynamic data) =>
      mockRequestCall().thenAnswer((_) async => Right(data));

  void mockRequestError(InfraErrorType error) =>
      mockRequestCall().thenAnswer((_) async => Left(InfraException(error)));
}
