import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ExternalException implements Exception {
  final ExternalErrorType errorType;
  ExternalException(this.errorType);

  @override
  String toString() => errorType.toString();
}