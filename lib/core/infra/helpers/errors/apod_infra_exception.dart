import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ApodInfraException implements Exception {
  final InfraErrorType errorType;
  ApodInfraException(this.errorType);

  @override
  String toString() => errorType.toString();
}