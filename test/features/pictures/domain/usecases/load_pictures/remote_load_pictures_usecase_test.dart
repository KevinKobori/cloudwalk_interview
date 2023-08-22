import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../apod.dart';

void main() {
  late RemoteLoadPicturesUsecase sut;
  late HttpClientSpy httpClient;
  late String url;
  late List<Map<String, String>> list;

  setUp(() async {
    list = [];
    httpClient = HttpClientSpy();
    httpClient.mockRequest(list);

    url = ApodTest.faker.internet.httpUrl();
    sut = RemoteLoadPicturesUsecase(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.call();

    ApodTest.verify(() => httpClient.request(method: 'get', url: url));
  });

  test('Should return pictures list on 200', () async {});

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {});

  test('Should throw UnexpectedError if HttpClient not returns 200', () async {});
}