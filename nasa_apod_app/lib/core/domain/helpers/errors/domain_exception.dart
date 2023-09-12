import 'package:nasa_apod_app/nasa_apod_app.dart';

class DomainException implements Exception {
  final DomainErrorType errorType;
  DomainException(this.errorType);

  @override
  String toString() => errorType.toString();
}
