import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../../../../apod.dart';

void main() {
  late PictureDatasource pictureDatasource;
  late PictureRepository pictureRepository;
  late RemoteLoadPicturesUseCase sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    pictureDatasource = PictureDatasource(httpClient);
    pictureRepository = PictureRepository(pictureDatasource);
    url = ApodTest.faker.internet.httpUrl();
    sut = RemoteLoadPicturesUseCase(
      picturesRepository: pictureRepository,
      url: url,
    );
  });

  test('Should call HttpClient with correct values', () async {
    final data = <Map<String, dynamic>>{};

    httpClient.mockRequestSuccess(data);

    await sut.loadLastTenDaysData();

    ApodTest.verify(() => httpClient.request(method: 'get', url: url));
  });

  test('Should return pictures list on 200 with valid data', () async {
    final data = ApodResponsesFactory().generateValidPictureMapList();

    // final matcher = List<PictureEntity>.from(data.map((map) => PictureMapper()
    //     .fromMapToModel(map)
    //     .whenSuccess((model) => PictureMapper()
    //         .fromModelToEntity(model)
    //         .whenSuccess((entity) => entity)))).toList();
    final matcher = List<PictureEntity>.from(
      data.map((map) {
        return PictureMapper().fromMapToEntity(map);
      }),
    ).toList();

    httpClient.mockRequestSuccess(data);

    final result = await sut.loadLastTenDaysData();

    final actual = result.fold((success) => success, (error) => error);

    expect(actual, matcher);
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    httpClient.mockRequestSuccess(
        ApodResponsesFactory().generateInvalidPictureMapList());

    final result = await sut.loadLastTenDaysData();

    final actual = result.fold((success) => success, (error) => error);

    expect(
        actual,
        predicate((e) =>
            e is DomainException && e.errorType == DomainErrorType.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient not returns 200', () async {
    httpClient.mockRequestError(ApodResponsesFactory().generateNotFoundError());

    final result = await sut.loadLastTenDaysData();

    final actual = result.fold((success) => success, (error) => error);

    expect(
        actual,
        predicate((e) =>
            e is DomainException && e.errorType == DomainErrorType.unexpected));
  });
}
