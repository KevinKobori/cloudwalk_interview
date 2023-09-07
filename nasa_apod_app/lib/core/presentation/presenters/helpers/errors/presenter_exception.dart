import 'package:nasa_apod_app/nasa_apod_app.dart';

class PresenterException implements Exception {
  final PresenterErrorType errorType;
  PresenterException(this.errorType);

  @override
  String toString() => errorType.toString();
}
