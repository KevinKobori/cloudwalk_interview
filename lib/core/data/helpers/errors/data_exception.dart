import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class DataException implements Exception {
  final DataErrorType errorType;
  DataException(this.errorType);

  @override
  String toString() => errorType.toString();
}
