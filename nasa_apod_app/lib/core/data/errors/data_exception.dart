import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class DataException implements Exception {
  final DataErrorType error;
  DataException(this.error);

  @override
  String toString() => error.toString();
}
