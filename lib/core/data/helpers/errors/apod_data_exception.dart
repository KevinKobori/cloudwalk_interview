import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ApodDataException implements Exception {
  final DataErrorType errorType;
  ApodDataException(this.errorType);

  @override
  String toString() => errorType.toString();
}