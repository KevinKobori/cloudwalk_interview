import 'package:dartz/dartz.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalStorageAdapter implements ILocalStorage {
  final LocalStorage localStorage;

  LocalStorageAdapter({required this.localStorage});

  @override
  Future<Either<CacheFailure, void>> save(
      {required String itemKey, required dynamic itemValue}) async {
    try {
      await localStorage.deleteItem(itemKey);
      await localStorage.setItem(itemKey, itemValue);
      return const Right(null);
    } catch (_) {
      return Left(CacheFailure(DataFailureType.unexpected));
    }
  }

  @override
  Future<Either<CacheFailure, void>> delete(String itemKey) async {
    try {
      await localStorage.deleteItem(itemKey);
      return const Right(null);
    } catch (_) {
      return Left(CacheFailure(DataFailureType.unexpected));
    }
  }

  @override
  Future<Either<CacheFailure, dynamic>> fetch(String itemKey) async {
    try {
      final data = await localStorage.getItem(itemKey);
      return Right(data);
    } catch (_) {
      return Left(CacheFailure(DataFailureType.unexpected));
    }
  }
}
