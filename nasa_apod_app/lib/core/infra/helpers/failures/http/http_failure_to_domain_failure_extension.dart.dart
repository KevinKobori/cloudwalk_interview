import 'package:nasa_apod_app/nasa_apod_app.dart';

extension HttpFailureToDomainFailureExtension on HttpFailure {
  DomainFailure get toDomainFailure {
    switch (this) {
      case HttpFailure.badRequest:
        return DomainFailure.unexpected;
      case HttpFailure.forbidden:
        return DomainFailure.unexpected;
      case HttpFailure.invalidData:
        return DomainFailure.invalidData;
      case HttpFailure.notFound:
        return DomainFailure.notFound;
      case HttpFailure.internalServerError:
        return DomainFailure.internalServerError;
      case HttpFailure.unauthorized:
        return DomainFailure.unexpected;
      default:
        return DomainFailure.unexpected;
    }
  }
}
