import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainErrorTypeExtension on DomainErrorType {
  PresenterErrorType get presenterError {
    switch (this) {
      case DomainErrorType.unexpected:
        return PresenterErrorType.unexpected;
    }
  }

   DataErrorType get dataError {
    switch (this) {
      case DomainErrorType.unexpected:
        return DataErrorType.unexpected;
    }
  }
}
