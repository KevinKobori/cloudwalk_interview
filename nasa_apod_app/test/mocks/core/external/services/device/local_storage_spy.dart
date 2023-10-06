import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalStorageSpy extends Mock implements ILocalStorage {
  LocalStorageSpy() {
    mockDeleteSuccess();
    mockSaveSuccess();
  }

  When<Future<Either<DataException, dynamic>>> mockFetchCall() =>
      when(() => fetch(any()));
  void mockFetchSuccess(dynamic json) async =>
      mockFetchCall().thenAnswer((_) async => Right(json));
  void mockFetchError(DataErrorType error) =>
      mockFetchCall().thenAnswer((_) async => Left(MapperException(error)));

  When<Future<Either<DataException, void>>> mockDeleteCall() =>
      when(() => delete(any()));
  void mockDeleteSuccess() =>
      mockDeleteCall().thenAnswer((_) async => const Right(null));
  void mockDeleteError(DataErrorType error) =>
      mockDeleteCall().thenAnswer((_) async => Left(MapperException(error)));

  When<Future<Either<DataException, void>>> mockSaveCall() => when(() => save(
      itemKey: any(named: 'itemKey'),
      itemValue: any<Map<String, dynamic>>(named: 'itemValue')));
  void mockSaveSuccess() =>
      mockSaveCall().thenAnswer((_) async => const Right(null));
  void mockSaveError(DataErrorType error) =>
      mockSaveCall().thenAnswer((_) async => Left(MapperException(error)));
}
