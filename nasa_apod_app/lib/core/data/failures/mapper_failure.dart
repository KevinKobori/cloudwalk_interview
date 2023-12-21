import 'package:nasa_apod_app/nasa_apod_app.dart';

enum MapperFailure {
  invalidJsonFormat('Invalid Json Format'),
  conversionError('Conversion Error');

  final String message;

  const MapperFailure(this.message);
}

extension MapperFailureTypeExtension on MapperFailure {
  DomainFailure get toDomainFailure {
    switch (this) {
      case MapperFailure.invalidJsonFormat:
        return DomainFailure.unexpected;
      case MapperFailure.conversionError:
        return DomainFailure.unexpected;
    }
  }
}
