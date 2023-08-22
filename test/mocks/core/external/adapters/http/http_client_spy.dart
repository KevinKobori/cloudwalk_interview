import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class HttpClientSpy extends Mock implements IHttpClient {
  When<Future<Result<dynamic, ExternalException>>> mockRequestCall() => when(() => request(
      url: any(named: 'url'),
      method: any(named: 'method'),
      body: any(named: 'body'),
      headers: any(named: 'headers')));
  void mockRequest(dynamic data) =>
      mockRequestCall().thenAnswer((_) async => Success(data));
  void mockRequestError(ExternalErrorType error) =>
      mockRequestCall().thenAnswer((_) async => Error(ExternalException(error)));
}
