import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainFailureTypeUIExtension on DomainFailureType {
  String get i18nFailure {
    switch (this) {
      case DomainFailureType.unexpected:
        return I18n.strings.unexpectedFailure;
    }
  }
}
