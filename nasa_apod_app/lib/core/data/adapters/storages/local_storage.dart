import 'package:dartz/dartz.dart';
import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class LocalStorage {
  Future<Either<MapperFailure, void>> save(
      {required String itemKey, required dynamic itemValue});
  Future<Either<MapperFailure, void>> delete(String itemKey);
  Future<Either<MapperFailure, dynamic>> fetch(String itemKey);
}

class LocalStorageAdapter implements LocalStorage {
  final ls.LocalStorage localStorage;

  LocalStorageAdapter({required this.localStorage});

  @override
  Future<Either<MapperFailure, void>> save(
      {required String itemKey, required dynamic itemValue}) async {
    try {
      await localStorage.deleteItem(itemKey);
      await localStorage.setItem(itemKey, itemValue);
      return const Right(null);
    } catch (_) {
      return const Left(MapperFailure.invalidJsonFormat);
    }
  }

  @override
  Future<Either<MapperFailure, void>> delete(String itemKey) async {
    try {
      await localStorage.deleteItem(itemKey);
      return const Right(null);
    } catch (_) {
      return const Left(MapperFailure.invalidJsonFormat);
    }
  }

  @override
  Future<Either<MapperFailure, dynamic>> fetch(String itemKey) async {
    try {
      final data = await localStorage.getItem(itemKey);
      return Right(data);
    } catch (_) {
      return const Left(MapperFailure.invalidJsonFormat);
    }
  }
}
