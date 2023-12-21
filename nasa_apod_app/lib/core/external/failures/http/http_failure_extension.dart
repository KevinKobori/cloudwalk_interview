import 'package:nasa_apod_app/nasa_apod_app.dart';

extension HttpFailureExtension on HttpFailure {
  DataFailureType get dataFailure {
    switch (this) {
      case HttpFailure.badRequest:
        return DataFailureType.unexpected;
      case HttpFailure.forbidden:
        return DataFailureType.unexpected;
      case HttpFailure.invalidData:
        return DataFailureType.invalidData;
      case HttpFailure.notFound:
        return DataFailureType.notFound;
      case HttpFailure.serverFailure:
        return DataFailureType.unexpected;
      case HttpFailure.unauthorized:
        return DataFailureType.unexpected;
    }
  }
}
