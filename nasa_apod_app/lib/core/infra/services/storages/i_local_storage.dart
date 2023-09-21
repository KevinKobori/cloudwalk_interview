import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class ILocalStorage {
  Future<Either<InfraException, void>> save(
      {required String key, required dynamic value});
  Future<Either<InfraException, void>> delete(String key);
  Future<Either<InfraException, dynamic>> fetch(String key);
}
