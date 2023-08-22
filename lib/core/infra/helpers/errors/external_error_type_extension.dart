import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

extension ExternalErrorTypeExtension on ExternalErrorType {
  InfraErrorType get infraError {
    switch (this) {
      case ExternalErrorType.badRequest:
        return InfraErrorType.unexpected;
      case ExternalErrorType.forbidden:
        return InfraErrorType.unexpected;
      case ExternalErrorType.invalidData:
        return InfraErrorType.unexpected;
      case ExternalErrorType.notFound:
        return InfraErrorType.unexpected;
      case ExternalErrorType.serverError:
        return InfraErrorType.unexpected;
      case ExternalErrorType.unauthorized:
        return InfraErrorType.unexpected;
    }
  }
}
