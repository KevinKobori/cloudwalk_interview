import 'package:nasa_apod_app/nasa_apod_app.dart';

extension ExternalErrorTypeExtension on ExternalErrorType {
  InfraErrorType get infraError {
    switch (this) {
      case ExternalErrorType.badRequest:
        return InfraErrorType.unexpected;
      case ExternalErrorType.forbidden:
        return InfraErrorType.unexpected;
      case ExternalErrorType.invalidData:
        return InfraErrorType.invalidData;
      case ExternalErrorType.notFound:
        return InfraErrorType.notFound;
      case ExternalErrorType.serverError:
        return InfraErrorType.unexpected;
      case ExternalErrorType.unauthorized:
        return InfraErrorType.unexpected;
    }
  }
}
