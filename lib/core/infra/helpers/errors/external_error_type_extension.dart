import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

extension ExternalErrorTypeExtension on ExternalErrorType {
  InfraErrorType get infraError {
    switch (this) {
      case ExternalErrorType.unexpected:
        return InfraErrorType.unexpected;
      default:
        return InfraErrorType.unexpected;
    }
  }
}
