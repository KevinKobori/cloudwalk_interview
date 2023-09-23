import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class ILocalStorage {
  Future<Either<InfraException, void>> save(
      {required String itemKey, required dynamic itemValue});
  Future<Either<InfraException, void>> delete(String itemKey);
  Future<Either<InfraException, dynamic>> fetch(String itemKey);
}
