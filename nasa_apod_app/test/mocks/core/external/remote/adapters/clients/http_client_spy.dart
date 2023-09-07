import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class HttpClientSpy extends Mock implements IHttpClient {
  When<Future<Result<dynamic, InfraException>>> mockRequestCall() =>
      when(() => request(
          url: any(named: 'url'),
          method: any(named: 'method'),
          body: any(named: 'body'),
          headers: any(named: 'headers')));

  void mockRequestSuccess(dynamic data) =>
      mockRequestCall().thenAnswer((_) async => Success(data));

  void mockRequestError(InfraErrorType error) => mockRequestCall()
      .thenAnswer((_) async => Error(InfraException(error)));
}
