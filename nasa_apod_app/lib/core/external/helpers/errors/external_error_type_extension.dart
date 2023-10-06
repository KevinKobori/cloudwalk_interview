import 'package:nasa_apod_app/nasa_apod_app.dart';

extension ExternalErrorTypeExtension on ExternalErrorType {
  DataErrorType get infraError {
    switch (this) {
      case ExternalErrorType.badRequest:
        return DataErrorType.unexpected;
      case ExternalErrorType.forbidden:
        return DataErrorType.unexpected;
      case ExternalErrorType.invalidData:
        return DataErrorType.invalidData;
      case ExternalErrorType.notFound:
        return DataErrorType.notFound;
      case ExternalErrorType.serverError:
        return DataErrorType.unexpected;
      case ExternalErrorType.unauthorized:
        return DataErrorType.unexpected;
    }
  }
}
