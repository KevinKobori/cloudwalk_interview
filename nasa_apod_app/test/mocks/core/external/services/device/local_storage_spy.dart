import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalStorageSpy extends Mock implements LocalStorage {
  LocalStorageSpy() {
    mockDeleteSuccess();
    mockSaveSuccess();
  }

  When<Future<Either<LocalStorageFailure, dynamic>>> mockFetchCall() =>
      when(() => fetch(any()));
  void mockFetchSuccess(dynamic json) async =>
      mockFetchCall().thenAnswer((_) async => Right(json));
  void mockFetchFailure(LocalStorageFailure error) =>
      mockFetchCall().thenAnswer((_) async => Left(error));

  When<Future<Either<LocalStorageFailure, void>>> mockDeleteCall() =>
      when(() => delete(any()));
  void mockDeleteSuccess() =>
      mockDeleteCall().thenAnswer((_) async => const Right(null));
  void mockDeleteFailure(LocalStorageFailure error) =>
      mockDeleteCall().thenAnswer((_) async => Left(error));

  When<Future<Either<LocalStorageFailure, void>>> mockSaveCall() =>
      when(() => save(
          itemKey: any(named: 'itemKey'),
          itemValue: any<Map<String, dynamic>>(named: 'itemValue')));
  void mockSaveSuccess() =>
      mockSaveCall().thenAnswer((_) async => const Right(null));
  void mockSaveFailure(LocalStorageFailure error) =>
      mockSaveCall().thenAnswer((_) async => Left(error));
}
