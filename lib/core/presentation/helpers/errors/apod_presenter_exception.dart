import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ApodPresenterException implements Exception {
  final PresenterErrorType errorType;
  ApodPresenterException(this.errorType);

  @override
  String toString() => errorType.toString();
}