import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class PresenterException implements Exception {
  final PresenterErrorType errorType;
  PresenterException(this.errorType);

  @override
  String toString() => errorType.toString();
}