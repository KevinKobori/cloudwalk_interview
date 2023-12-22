import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../../../../apod.dart';

void main() {
  late LocalValidatePicturesUseCase sut;
  late LocalStorageSpy localStorage;
  late String itemKey;

  setUp(() {
    localStorage = LocalStorageSpy();
    itemKey = 'pictures_list';
    sut = LocalValidatePicturesUseCaseImpl(
      localStorage: localStorage,
      itemKey: itemKey,
    );
  });

  group('Validating', () {
    test('When validate data should call localStorage with correct key',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      await sut.call(null);

      verify(() => localStorage.fetch('pictures_list')).called(1);
    });

    test('When validate data should delete localStorage if it is invalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureMapList());

      final result = await sut.call(null);
      result.fold((l) => l, (r) => r);

      verify(() => localStorage.delete('pictures_list')).called(1);
    });

    test('When validate data should delete localStorage if it is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureMapList());

      await sut.call(null);

      verify(() => localStorage.delete('pictures_list')).called(1);
    });

    test('When validate data should delete localStorage if fetch fails',
        () async {
      localStorage.mockFetchFailure(LocalStorageFailure.unknownError);

      final result = await sut.call(null);

      result.fold((l) => l, (r) => r);

      verify(() => localStorage.delete('pictures_list')).called(1);
    });
  });
}
