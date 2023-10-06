import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainErrorTypeExtension on DomainErrorType {
  String get i18nError {
    switch (this) {
      case DomainErrorType.unexpected:
        return I18n.strings.unexpectedError;
    }
  }
}
