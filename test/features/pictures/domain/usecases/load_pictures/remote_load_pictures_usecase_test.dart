import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:http/http.dart';

import '../../../../../apod.dart';

void main() {
  late RemoteLoadPicturesUsecase sut;
  late Client httpClient;
  late String url;

  ApodTest.setUp(() async {
    sut = RemoteLoadPicturesUsecase();
    httpClient = Client();
    url = ApodTest.faker.internet.httpUrl();
  });

  ApodTest.test('Should call HttpClient with correct values', () async {
    await sut.call();

    ApodTest.verify(() => httpClient.get(Uri.parse(url)));
  });

  ApodTest.test('Should return pictures list on 200', () async {});

  ApodTest.test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {});

  ApodTest.test('Should throw UnexpectedError if HttpClient not returns 200', () async {});
}