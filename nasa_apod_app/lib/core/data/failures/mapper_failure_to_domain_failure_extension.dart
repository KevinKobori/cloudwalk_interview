import 'package:nasa_apod_app/nasa_apod_app.dart';

extension MapperFailureToDomainFailureExtension on MapperFailure {
  DomainFailure get fromJsonperToDomain {
    switch (this) {
      case MapperFailure.invalidJsonFormat:
        return DomainFailure.unexpected;
      case MapperFailure.conversionError:
        return DomainFailure.unexpected;
    }
  }
}
