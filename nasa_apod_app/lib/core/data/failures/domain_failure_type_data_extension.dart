import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainFailureTypeDataExtension on DomainFailureType {
  DataFailureType get dataFailure {
    switch (this) {
      case DomainFailureType.unexpected:
        return DataFailureType.unexpected;
    }
  }
}
