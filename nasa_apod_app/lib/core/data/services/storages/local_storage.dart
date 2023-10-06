import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class LocalStorage {
  Future<Either<DataFailure, void>> save(
      {required String itemKey, required dynamic itemValue});
  Future<Either<DataFailure, void>> delete(String itemKey);
  Future<Either<DataFailure, dynamic>> fetch(String itemKey);
}
