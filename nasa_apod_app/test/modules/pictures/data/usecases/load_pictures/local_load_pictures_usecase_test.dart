import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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

      verify(() => localStorage.fetch('pictures_list')).called(1);
    });

    test('When load data should return a list of pictures on success',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureMapList();
      final mapList = data;
      late final List<PictureEntity> matcher;
      PictureMapper().fromMapListToEntityList(mapList).fold(
        (domainException) {},
        (pictureEntityList) {
          matcher = pictureEntityList;
        },
      );

      localStorage.mockFetchSuccess(data);

      late List<PictureEntity> actual;
      final resultSUT = await sut.loadLastTenDaysData();
      resultSUT.fold(
        (domainException) {},
        (pictureEntityList) {
          actual = pictureEntityList;
        },
      );

      expect(actual, matcher);
    });

    test('When load data should throw UnexpectedError if localStorage is empty',
        () async {
      localStorage.mockFetchSuccess(<Map<String, dynamic>>[]);

      final result = await sut.loadLastTenDaysData();

      final actual = result.fold(
        (domainException) => domainException,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainException &&
            element.errorType == DomainErrorType.unexpected),
      );
    });

    test(
        'When load data should throw UnexpectedError if localStorage is isvalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      final result = await sut.loadLastTenDaysData();

      final actual = result.fold(
        (domainException) => domainException,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainException &&
            element.errorType == DomainErrorType.unexpected),
      );
    });

    test(
        'When load data should throw UnexpectedError if localStorage is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureMapList());

      final result = await sut.loadLastTenDaysData();

      final actual = result.fold(
        (domainException) => domainException,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainException &&
            element.errorType == DomainErrorType.unexpected),
      );
    });

    test('When load data should throw UnexpectedError if localStorage throws',
        () async {
      localStorage.mockFetchError(InfraErrorType.invalidData);

      final result = await sut.loadLastTenDaysData();

      final actual = result.fold(
        (domainException) => domainException,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainException &&
            element.errorType == DomainErrorType.unexpected),
      );
    });
  });

  group('Validating', () {
    test('When validate data should call localStorage with correct key',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      await sut.validateLastTenDaysData();

      verify(() => localStorage.fetch('pictures_list')).called(1);
    });

    test('When validate data should delete localStorage if it is invalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      final result = await sut.validateLastTenDaysData();
      result.fold((l) => l, (r) => r);

      verify(() => localStorage.delete('pictures_list')).called(1);
    });

    test('When validate data should delete localStorage if it is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureMapList());

      await sut.validateLastTenDaysData();

      verify(() => localStorage.delete('pictures_list')).called(1);
    });

    test('When validate data should delete localStorage if fetch fails',
        () async {
      localStorage.mockFetchError(InfraErrorType.invalidData);

      final result = await sut.validateLastTenDaysData();

      result.fold((l) => l, (r) => r);

      verify(() => localStorage.delete('pictures_list')).called(1);
    });
  });

  group('Saving', () {
    test('When save data should call localStorage with correct values',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureMapList();
      final mapList = data;

      localStorage.mockSaveSuccess();

      await PictureMapper().fromMapListToEntityList(mapList).fold(
        (domainException) {},
        (pictureEntityList) async {
          final result = await sut.saveLastTenDaysData(pictureEntityList);
          return result.fold(
            (domainException) {},
            (_) {},
          );
        },
      );

      verify(() => localStorage.save(
              itemKey: 'pictures_list',
              itemValue: any<dynamic>(named: 'itemValue')))
          .called(1); // TODO: NOW - CHANGE EXPECTED VALUE
    });

    test('When save data should throw UnexpectedError if save throws',
        () async {
      final mapList = DeviceLocalStorageFactory().generateValidPictureMapList();

      localStorage.mockSaveError(InfraErrorType.invalidData);

      late final List<PictureEntity> matcher;

      PictureMapper().fromMapListToEntityList(mapList).fold(
        (domainException) {},
        (pictureEntityList) {
          matcher = pictureEntityList;
        },
      );

      final result = await sut.saveLastTenDaysData(matcher);

      final actual = result.fold(
        (domainException) => domainException,
        (_) {},
      );

      expect(
          actual,
          predicate((element) =>
              element is DomainException &&
              element.errorType == DomainErrorType.unexpected));
    });
  });
}
