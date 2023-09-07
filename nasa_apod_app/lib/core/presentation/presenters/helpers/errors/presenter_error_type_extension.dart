import 'package:nasa_apod_app/nasa_apod_app.dart';

extension PresenterErrorTypeExtension on PresenterErrorType {
  String get i18nError {
    switch (this) {
      case PresenterErrorType.unexpected:
        return I18n.strings.unexpectedError;
      case PresenterErrorType.invalidData:
        return I18n.strings.unexpectedError;
    }
  }
}
