import 'package:nasa_apod_app/nasa_apod_app.dart';

extension ExternalFailureTypeExtension on ExternalFailureType {
  DataFailureType get infraFailure {
    switch (this) {
      case ExternalFailureType.badRequest:
        return DataFailureType.unexpected;
      case ExternalFailureType.forbidden:
        return DataFailureType.unexpected;
      case ExternalFailureType.invalidData:
        return DataFailureType.invalidData;
      case ExternalFailureType.notFound:
        return DataFailureType.notFound;
      case ExternalFailureType.serverFailure:
        return DataFailureType.unexpected;
      case ExternalFailureType.unauthorized:
        return DataFailureType.unexpected;
    }
  }
}
