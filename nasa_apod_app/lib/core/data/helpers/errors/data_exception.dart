import 'package:nasa_apod_app/nasa_apod_app.dart';

class DataException implements Exception {
  final DataErrorType errorType;
  DataException(this.errorType);

  @override
  String toString() => errorType.toString();
}
