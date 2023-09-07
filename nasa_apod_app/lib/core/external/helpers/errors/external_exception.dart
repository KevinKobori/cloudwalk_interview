import 'package:nasa_apod_app/nasa_apod_app.dart';

class ExternalException implements Exception {
  final ExternalErrorType errorType;
  ExternalException(this.errorType);

  @override
  String toString() => errorType.toString();
}
