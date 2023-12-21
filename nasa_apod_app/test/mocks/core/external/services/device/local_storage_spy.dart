import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalStorageSpy extends Mock implements LocalStorage {
  LocalStorageSpy() {
    mockDeleteSuccess();
    mockSaveSuccess();
  }

  When<Future<Either<MapperFailure, dynamic>>> mockFetchCall() =>
      when(() => fetch(any()));
  void mockFetchSuccess(dynamic json) async =>
      mockFetchCall().thenAnswer((_) async => Right(json));
  void mockFetchFailure(MapperFailure error) =>
      mockFetchCall().thenAnswer((_) async => Left(error));

  When<Future<Either<MapperFailure, void>>> mockDeleteCall() =>
      when(() => delete(any()));
  void mockDeleteSuccess() =>
      mockDeleteCall().thenAnswer((_) async => const Right(null));
  void mockDeleteFailure(MapperFailure error) =>
      mockDeleteCall().thenAnswer((_) async => Left(error));

  When<Future<Either<MapperFailure, void>>> mockSaveCall() => when(() => save(
      itemKey: any(named: 'itemKey'),
      itemValue: any<Map<String, dynamic>>(named: 'itemValue')));
  void mockSaveSuccess() =>
      mockSaveCall().thenAnswer((_) async => const Right(null));
  void mockSaveFailure(MapperFailure error) =>
      mockSaveCall().thenAnswer((_) async => Left(error));
}
