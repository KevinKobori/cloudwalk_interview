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

    final List<PictureEntity>? actual = result.whenSuccess((success) => success);

    final List<PictureEntity> matcher = List<PictureEntity>.from(apodObjects.map((map) => 
      PictureMapper.fromMapToModel(map).whenSuccess((model) => 
        PictureMapper.fromModelToEntity(model).whenSuccess((entity) => entity)))).toList();

    expect(actual, matcher);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {});

  test('Should throw UnexpectedError if HttpClient not returns 200', () async {});
}