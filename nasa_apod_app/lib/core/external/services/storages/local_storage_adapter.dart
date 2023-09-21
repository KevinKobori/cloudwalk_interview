import 'package:dartz/dartz.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalStorageAdapter implements ILocalStorage {
  final LocalStorage localStorage;

  LocalStorageAdapter({required this.localStorage});

  @override
  Future<Either<InfraException, void>> save(
      {required String key, required dynamic value}) async {
    try {
      await localStorage.deleteItem(key);
      await localStorage.setItem(key, value);
      return const Right(null);
    } catch (_) {
      return Left(InfraException(InfraErrorType.unexpected));
    }
  }

  @override
  Future<Either<InfraException, void>> delete(String key) async {
    try {
      await localStorage.deleteItem(key);
      return const Right(null);
    } catch (_) {
      return Left(InfraException(InfraErrorType.unexpected));
    }
  }

  @override
  Future<Either<InfraException, dynamic>> fetch(String key) async {
    try {
      final data = await localStorage.getItem(key);
      return Right(data);
    } catch (_) {
      return Left(InfraException(InfraErrorType.unexpected));
    }
  }
}
