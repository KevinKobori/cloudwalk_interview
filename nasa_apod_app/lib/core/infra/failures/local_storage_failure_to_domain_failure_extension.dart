import 'package:nasa_apod_app/nasa_apod_app.dart';

extension LocalStorageFailureToDomainFailureExtension on LocalStorageFailure {
  DomainFailure get fromLocalStorageToDomain {
    switch (this) {
      case LocalStorageFailure.unknownError:
        return DomainFailure.unexpected;
    }
  }
}
