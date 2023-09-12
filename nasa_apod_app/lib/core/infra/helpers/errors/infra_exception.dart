import 'package:nasa_apod_app/nasa_apod_app.dart';

class InfraException implements Exception {
  final InfraErrorType errorType;
  InfraException(this.errorType);

  @override
  String toString() => errorType.toString();
}
