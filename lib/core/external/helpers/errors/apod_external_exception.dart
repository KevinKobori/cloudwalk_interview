import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ApodExternalException implements Exception {
  final ExternalErrorType errorType;
  ApodExternalException(this.errorType);

  @override
  String toString() => errorType.toString();
}