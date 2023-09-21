import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalStorageSpy extends Mock implements ILocalStorage {
  LocalStorageSpy() {
    mockDeleteSuccess();
    mockSaveSuccess();
  }

  When<Future<Either<InfraException, dynamic>>> mockFetchCall() =>
      when(() => fetch(any()));
  void mockFetchSuccess(dynamic json) async =>
      mockFetchCall().thenAnswer((_) async => Right(json));
  void mockFetchError(InfraErrorType error) =>
      mockFetchCall().thenAnswer((_) async => Left(InfraException(error)));

  When<Future<Either<InfraException, void>>> mockDeleteCall() =>
      when(() => delete(any()));
  void mockDeleteSuccess() =>
      mockDeleteCall().thenAnswer((_) async => const Right(null));
  void mockDeleteError(InfraErrorType error) =>
      mockDeleteCall().thenAnswer((_) async => Left(InfraException(error)));

  When<Future<Either<InfraException, void>>> mockSaveCall() => when(
      () => save(key: any(named: 'key'), value: any<dynamic>(named: 'value')));
  void mockSaveSuccess() =>
      mockSaveCall().thenAnswer((_) async => const Right(null));
  void mockSaveError(InfraErrorType error) =>
      mockSaveCall().thenAnswer((_) async => Left(InfraException(error)));
}
