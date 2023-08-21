import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ApodDomainException implements Exception {
  final DomainErrorType errorType;
  ApodDomainException(this.errorType);

  @override
  String toString() => errorType.toString();
}