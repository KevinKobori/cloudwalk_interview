import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class LocalStorage {
  Future<Either<MapperFailure, void>> save(
      {required String itemKey, required dynamic itemValue});
  Future<Either<MapperFailure, void>> delete(String itemKey);
  Future<Either<MapperFailure, dynamic>> fetch(String itemKey);
}