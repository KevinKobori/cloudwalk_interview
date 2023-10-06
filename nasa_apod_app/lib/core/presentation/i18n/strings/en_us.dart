import 'package:nasa_apod_app/nasa_apod_app.dart';

class EnUs implements Translation {
  /// Failures
  @override
  String get unexpectedFailure => 'Unexpected Failure!';
  @override
  String get notHaveInternetConnectionFailure =>
      'Check your internet connection and try again!';

  /// Strings
  @override
  String get reload => 'Reload!';
}
