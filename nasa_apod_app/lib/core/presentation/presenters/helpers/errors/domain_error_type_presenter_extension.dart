import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainErrorTypePresenterExtension on DomainErrorType {
  PresenterErrorType get presenterError {
    switch (this) {
      case DomainErrorType.unexpected:
        return PresenterErrorType.unexpected;
    }
  }
}
