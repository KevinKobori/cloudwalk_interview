import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class DomainException implements Exception {
  final DomainErrorType errorType;
  DomainException(this.errorType);

  @override
  String toString() => errorType.toString();
}