import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../../../../apod.dart';

void main() {
  late PictureDatasourceImpl pictureDatasource;
  late PictureRepositoryImpl pictureRepository;
  late RemoteLoadLastTenDaysPicturesByDateUseCaseImpl sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    pictureDatasource = PictureDatasourceImpl(httpClient);
    pictureRepository = PictureRepositoryImpl(pictureDatasource);
    url = ApodTest.faker.internet.httpUrl();
    sut = RemoteLoadLastTenDaysPicturesByDateUseCaseImpl(
      picturesRepository: pictureRepository,
      url: url,
    );
  });

  test('Should call HttpClient with correct values', () async {
    final data = <Map<String, dynamic>>{};

    httpClient.mockRequestSuccess(data);

    await sut.call(null);

    ApodTest.verify(() => httpClient.request(method: 'get', url: url));
  });

  test('Should return pictures list on 200 with valid data', () async {
    final data =
        json.encode(ApodResponsesFactory().generateValidPictureMapList());

    httpClient.mockRequestSuccess(data);

    final dynamicList = json.decode(data);

    final resultMapList = JsonMapper.fromDynamicListToMapList(dynamicList);

    late final List<Map<String, dynamic>> mapList;

    resultMapList.fold(
      (l) {},
      (r) {
        mapList = r;
      },
    );

    late final List<PictureEntity> matcher;

    PictureMapper().fromMapListToEntityList(mapList).fold(
      (domainFailure) {},
      (pictureEntityList) {
        matcher = pictureEntityList;
      },
    );

    final resultSUT = await sut.call(null);

    late List<PictureEntity> actual;

    resultSUT.fold(
      (domainFailure) {},
      (pictureEntityList) {
        actual = pictureEntityList;
      },
    );

    expect(actual, matcher);
  });

  test(
      'Should throw UnexpectedFailure if HttpClient returns 200 with invalid data',
      () async {
    httpClient.mockRequestSuccess(
        ApodResponsesFactory().generateInvalidPictureMapList());

    final result = await sut.call(null);

    final actual = result.fold(
      (domainFailure) => domainFailure,
      (pictureEntityList) => pictureEntityList,
    );

    expect(
        actual,
        predicate((element) =>
            element is DomainFailure &&
            element.error == DomainFailureType.unexpected));
  });

  test('Should throw UnexpectedFailure if HttpClient not returns 200', () async {
    httpClient.mockRequestFailure(ApodResponsesFactory().generateNotFoundFailure());

    final result = await sut.call(null);

    final actual = result.fold(
      (domainFailure) => domainFailure,
      (pictureEntityList) => pictureEntityList,
    );

    expect(
        actual,
        predicate((element) =>
            element is DomainFailure &&
            element.error == DomainFailureType.unexpected));
  });
}
