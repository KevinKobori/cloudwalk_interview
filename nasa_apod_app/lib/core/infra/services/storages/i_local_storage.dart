import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class ILocalStorage {
  Future<Either<DataException, void>> save(
      {required String itemKey, required dynamic itemValue});
  Future<Either<DataException, void>> delete(String itemKey);
  Future<Either<DataException, dynamic>> fetch(String itemKey);
}
