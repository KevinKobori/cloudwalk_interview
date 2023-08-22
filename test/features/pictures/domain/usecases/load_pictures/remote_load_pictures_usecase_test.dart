import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../apod.dart';

void main() {
  late RemoteLoadPicturesUsecase sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(()  {
    httpClient = HttpClientSpy();
    url = ApodTest.faker.internet.httpUrl();
    sut = RemoteLoadPicturesUsecase(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    httpClient.mockRequestSuccess(<Map<String, String>>{});
   
    await sut.call();

    ApodTest.verify(() => httpClient.request(method: 'get', url: url));
  });

  test('Should return pictures list on 200', () async {
    final List<Map<String, String>> apodObjects = apodObjectsListMock;
    httpClient.mockRequestSuccess(apodObjects);

    final Result<List<PictureEntity>, DomainException> result = await sut.call();

    final List<PictureEntity>? pictures = result.whenSuccess((success) => success);

    expect(pictures, [
      PictureEntity(
        date: apodObjects[0]['date'] as String,
        explanation: apodObjects[0]['explanation'] as String,
        hdurl: apodObjects[0]['hdurl'] as String,
        mediaType: apodObjects[0]['media_type'] as String,
        serviceVersion: apodObjects[0]['service_version'] as String,
        title: apodObjects[0]['title'] as String,
        url: apodObjects[0]['url'] as String,
      ),
      PictureEntity(
        date: apodObjects[1]['date'] as String,
        explanation: apodObjects[1]['explanation'] as String,
        hdurl: apodObjects[1]['hdurl'] as String,
        mediaType: apodObjects[1]['media_type'] as String,
        serviceVersion: apodObjects[1]['service_version'] as String,
        title: apodObjects[1]['title'] as String,
        url: apodObjects[1]['url'] as String,
      ),
    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {});

  test('Should throw UnexpectedError if HttpClient not returns 200', () async {});
}