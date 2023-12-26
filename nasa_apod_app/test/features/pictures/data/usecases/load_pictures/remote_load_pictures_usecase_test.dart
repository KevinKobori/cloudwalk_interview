import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../../../../apod.dart';

void main() {
  late PictureDatasourceImpl pictureDatasource;
  late DeviceInfo networkInfo;
  late PictureRepositoryImpl pictureRepository;
  late RemoteLoadLastTenDaysPicturesByDateUseCaseImpl sut;
  late HttpClientSpy httpClient;
  late String apiKey;
  late String url;
  late DateTime nowDate;

  setUp(() {
    nowDate = DateTime.now();
    httpClient = HttpClientSpy();
    pictureDatasource = PictureDatasourceImpl(httpClient);
    networkInfo = DeviceInfoImpl(InternetConnectionChecker());
    pictureRepository = PictureRepositoryImpl(
      networkInfo: networkInfo,
      pictureDatasource: pictureDatasource,
    );
    apiKey = ApodTest.faker.randomGenerator.string(10);

    final nasaApodEndDate =
        RemoteLoadLastTenDaysPicturesByDateUseCaseImpl.getNasaApodEndDate(
            nowDate);
    final nasaApodStartDate =
        RemoteLoadLastTenDaysPicturesByDateUseCaseImpl.getNasaApodStartDate(
            nowDate);

    url = apodApiUrlFactory(
      apiKey: apiKey,
      requestPath: '&start_date=$nasaApodStartDate&end_date=$nasaApodEndDate',
    );

    sut = RemoteLoadLastTenDaysPicturesByDateUseCaseImpl(
      picturesRepository: pictureRepository,
      apiKey: apiKey,
    );
    registerFallbackValue<HttpVerbs>(HttpVerbs.get);
  });

  test('Should call HttpClient with correct values', () async {
    final data = json.encode({});

    httpClient.mockRequestSuccess(data);

    await sut.call(nowDate);

    ApodTest.verify(() => httpClient.request(method: HttpVerbs.get, url: url));
  });

  test('Should return pictures list on 200 with valid data', () async {
    final data =
        json.encode(ApodResponsesFactory().generateValidPictureMapList());

    httpClient.mockRequestSuccess(data);

    final dynamicList = json.decode(data);

    final resultMapList = JsonMapper.fromDynamicListToJsonList(dynamicList);

    late final List<Map<String, dynamic>> mapList;

    resultMapList.fold(
      (l) {},
      (r) {
        mapList = r;
      },
    );

    late final List<PictureEntity> matcher;

    PictureMapper.fromJsonListToEntityList(mapList).fold(
      (domainFailure) {},
      (pictureEntityList) {
        matcher = pictureEntityList;
      },
    );

    final resultSUT = await sut.call(nowDate);

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
        json.encode(ApodResponsesFactory().generateInvalidPictureMapList()));

    final result = await sut.call(nowDate);

    final actual = result.fold(
      (domainFailure) => domainFailure,
      (pictureEntityList) => pictureEntityList,
    );

    expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.unexpected));
  });

  test('Should throw UnexpectedFailure if HttpClient not returns 200',
      () async {
    httpClient
        .mockRequestFailure(ApodResponsesFactory().generateNotFoundFailure());

    final result = await sut.call(nowDate);

    final actual = result.fold(
      (domainFailure) => domainFailure,
      (pictureEntityList) => pictureEntityList,
    );

    expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.notFound));
  });
}
