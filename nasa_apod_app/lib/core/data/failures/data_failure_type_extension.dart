import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DataFailureTypeExtension on DataFailureType {
  DomainFailureType get domainFailure {
    switch (this) {
      case DataFailureType.unexpected:
        return DomainFailureType.unexpected;
      case DataFailureType.invalidData:
        return DomainFailureType.unexpected;
      case DataFailureType.notFound:
        return DomainFailureType.unexpected;
    }
  }
}
