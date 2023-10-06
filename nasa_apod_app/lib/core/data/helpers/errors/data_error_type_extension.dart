import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DataErrorTypeExtension on DataErrorType {
  DomainErrorType get domainError {
    switch (this) {
      case DataErrorType.unexpected:
        return DomainErrorType.unexpected;
      case DataErrorType.invalidData:
        return DomainErrorType.unexpected;
      case DataErrorType.notFound:
        return DomainErrorType.unexpected;
    }
  }
}
