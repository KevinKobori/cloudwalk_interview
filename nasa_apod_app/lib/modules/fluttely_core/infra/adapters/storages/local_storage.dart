import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class LocalStorage {
  Future<Either<LocalStorageFailure, void>> save(
      {required String itemKey, required dynamic itemValue});
  Future<Either<LocalStorageFailure, void>> delete(String itemKey);
  Future<Either<LocalStorageFailure, dynamic>> fetch(String itemKey);
}
