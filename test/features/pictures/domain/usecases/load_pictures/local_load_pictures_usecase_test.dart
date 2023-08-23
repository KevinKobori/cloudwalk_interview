import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
      final data = DeviceLocalStorageFactory().generateValidApodObjectMapList();
      localStorage.mockFetchSuccess(data);

      await sut.loadLastTenDaysData();

      verify(() => localStorage.fetch('apod_objects')).called(1);
    });

    test('When load data should return a list of pictures on success',
        () async {
      final data = DeviceLocalStorageFactory().generateValidApodObjectMapList();

      final matcher = List<PictureEntity>.from(data.map((map) =>
          PicturesMapper().fromMapToModel(map).whenSuccess((model) =>
              PicturesMapper()
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
          DeviceLocalStorageFactory().generateInvalidApodObjectMapList());

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
          DeviceLocalStorageFactory.generateIncompleteApodObjectMapList());

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
        () async {});

    test('When validate data should delete localStorage if it is incomplete',
        () async {});

    test('When validate data should delete localStorage if fetch fails',
        () async {});
  });

  group('Saving', () {
    test('When save data should call localStorage with correct values',
        () async {});

    test('When save data should throw UnexpectedError if save throws',
        () async {});
  });
}
