import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../../../../apod.dart';

void main() {
  late LocalLoadPicturesUseCase sut;
  late LocalStorageSpy localStorage;

  setUp(() {
    localStorage = LocalStorageSpy();
    sut = LocalLoadPicturesUseCase(localStorage: localStorage);
  });

  group('Loading', () {
    test('When load data should call localStorage with correct key', () async {
      final data = DeviceLocalStorageFactory().generateValidPictureMapList();
      localStorage.mockFetchSuccess(data);

      await sut.loadLastTenDaysData();

      verify(() => localStorage.fetch('apod_objects')).called(1);
    });

    test('When load data should return a list of pictures on success',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureMapList();

      final matcher = List<PictureEntity>.from(data.map((map) =>
          PictureMapper().fromMapToModel(map).whenSuccess((model) =>
              PictureMapper()
                  .fromModelToEntity(model)
                  .whenSuccess((entity) => entity)))).toList();

      localStorage.mockFetchSuccess(data);

      final actual = await sut.loadLastTenDaysData();

      expect(actual, matcher);
    });

    test('When load data should throw UnexpectedError if localStorage is empty',
        () async {
      localStorage.mockFetchSuccess(<Map<String, dynamic>>[]);

      final future = sut.loadLastTenDaysData();

      expect(
          future,
          throwsA(predicate((e) =>
              e is DomainException &&
              e.errorType == DomainErrorType.unexpected)));
    });

    test(
        'When load data should throw UnexpectedError if localStorage is isvalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      final future = sut.loadLastTenDaysData();

      expect(
          future,
          throwsA(predicate((e) =>
              e is DomainException &&
              e.errorType == DomainErrorType.unexpected)));
    });

    test(
        'When load data should throw UnexpectedError if localStorage is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureMapList());

      final future = sut.loadLastTenDaysData();

      expect(
          future,
          throwsA(predicate((e) =>
              e is DomainException &&
              e.errorType == DomainErrorType.unexpected)));
    });

    test('When load data should throw UnexpectedError if localStorage throws',
        () async {
      localStorage.mockFetchError();

      final future = sut.loadLastTenDaysData();

      expect(
          future,
          throwsA(predicate((e) =>
              e is DomainException &&
              e.errorType == DomainErrorType.unexpected)));
    });
  });

  group('Validating', () {
    test('When validate data should call localStorage with correct key',
        () async {
      await sut.validateLastTenDaysData();

      verify(() => localStorage.fetch('apod_objects')).called(1);
    });

    test('When validate data should delete localStorage if it is invalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      await sut.validateLastTenDaysData();

      verify(() => localStorage.delete('apod_objects')).called(1);
    });

    test('When validate data should delete localStorage if it is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureMapList());

      await sut.validateLastTenDaysData();

      verify(() => localStorage.delete('apod_objects')).called(1);
    });

    test('When validate data should delete localStorage if fetch fails',
        () async {
      localStorage.mockFetchError();

      await sut.validateLastTenDaysData();

      verify(() => localStorage.delete('apod_objects')).called(1);
    });
  });

  group('Saving', () {
    test('When save data should call localStorage with correct values',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureMapList();

      final pictureEntityList = List<PictureEntity>.from(data.map((map) =>
          PictureMapper().fromMapToModel(map).whenSuccess((model) =>
              PictureMapper()
                  .fromModelToEntity(model)
                  .whenSuccess((entity) => entity)))).toList();

      await sut.saveLastTenDaysData(pictureEntityList);

      final Result<List<PictureModel>, DataException> result =
          await PictureMapper()
              .fromEntityListToModelList(pictureEntityList)
              .when(
                (pictureModelList) => Success(pictureModelList),
                (dataException) => Error(dataException),
              );

      final mapList =
          result.when((mapList) => mapList, (infraException) => infraException);

      verify(() => localStorage.save(key: 'apod_objects', value: mapList))
          .called(1);
    });

    test('When save data should throw UnexpectedError if save throws',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureMapList();

      localStorage.mockSaveError();

      final pictureEntityList = List<PictureEntity>.from(data.map((map) =>
          PictureMapper().fromMapToModel(map).whenSuccess((model) =>
              PictureMapper()
                  .fromModelToEntity(model)
                  .whenSuccess((entity) => entity)))).toList();

      final future = sut.saveLastTenDaysData(pictureEntityList);

      expect(
          future,
          throwsA(predicate((e) =>
              e is DomainException &&
              e.errorType == DomainErrorType.unexpected)));
    });
  });
}
