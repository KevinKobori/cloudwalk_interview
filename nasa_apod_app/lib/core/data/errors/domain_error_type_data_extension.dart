import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainErrorTypeDataExtension on DomainErrorType {
  DataErrorType get dataError {
    switch (this) {
      case DomainErrorType.unexpected:
        return DataErrorType.unexpected;
    }
  }
}
