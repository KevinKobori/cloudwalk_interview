import 'package:nasa_apod_app/nasa_apod_app.dart';

class DomainException implements Exception {
  final DomainErrorType error;
  DomainException(this.error);

  @override
  String toString() => error.toString();
}
