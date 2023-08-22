import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
// import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../apod.dart';

void main() {
  late RemoteLoadPicturesUsecase sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = ApodTest.faker.internet.httpUrl();
    sut = RemoteLoadPicturesUsecase(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    final data = <Map<String, String>>{};

    httpClient.mockRequestSuccess(data);

    await sut.loadLastTenDaysData();

    ApodTest.verify(() => httpClient.request(method: 'get', url: url));
  });

  test('Should return pictures list on 200 with valid data', () async {
    final data = ApodResponsesFactory().generateValidMapList();

    final matcher = List<PictureEntity>.from(data.map((map) => PicturesMapper()
        .fromMapToModel(map)
        .whenSuccess((model) => PicturesMapper()
            .fromModelToEntity(model)
            .whenSuccess((entity) => entity)))).toList();
    // print(matcher.map((e) => null));

    httpClient.mockRequestSuccess(data);

    final result = await sut.loadLastTenDaysData();

    List<PictureEntity>? actual;

    result.when(
      (success) => actual = success,
      (error) => null,
    );

    // if(result is Success) {
    //     actual = result.whenSuccess((success) => success)!.toList();
    // }
    // actual = result.tryGetSuccess();
    print(actual);
    expect(actual, matcher);
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    httpClient
        .mockRequestSuccess(ApodResponsesFactory().generateInvalidMapList());

    final result = await sut.loadLastTenDaysData();

    final actual = result.when((success) => success, (error) => error);

    // expect(actual, DomainException(DomainErrorType.unexpected));
    expect(
        actual,
        predicate((e) =>
            e is DomainException && e.errorType == DomainErrorType.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient not returns 200', () async {
//     sut = WeatherRepositoryImpl(apiService: mockWeatherApiService);
//     when(mockWeatherApiService.fetchWeatherByCity(city: "city"))
//         .thenAnswer((_) async => Future.value(weatherRepoMockData.badResponse));
//     final result = await sut.fetchWeatherByCity(city: "city");
//     verify(mockWeatherApiService.fetchWeatherByCity(city: "city")).called(1);
//     expect(result, isInstanceOf<DataError>);
//         verifyNoMoreInteractions(mockWeatherApiService);
  });

// @override
//     Future<Either<WeatherData, DataError>> fetchWeatherByCity({required String city}) async {
//       try {
//         var response = await apiService.fetchWeatherByCity(city: city);
//         if (response.statusCode == 200) {
//           return Left(WeatherData.fromJson(jsonDecode(response.body)));
//         } else {
//           return Right(DataError(title: "Error", description: "Desc", code: 0, url: "NoUrl"));
//         }
//       } catch (error) {
//         AppException exception = error as AppException;
//         return Right(DataError(
//             title: exception.title, description: exception.description, code: exception.code, url: exception.url));
//       }
}
