import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainFailureTypeUIExtension on DomainFailure {
  String get i18nFailure {
    switch (this) {
      case DomainFailure.unexpected:
        return I18n.strings.unexpectedFailure;
      case DomainFailure.notHaveInternetConnection:
        return I18n.strings.notHaveInternetConnectionFailure;
      case DomainFailure.internalServerError:
        return I18n.strings.internalServerErrorFailure;
      case DomainFailure.invalidData:
        return I18n.strings.invalidDataFailure;
      case DomainFailure.notFound:
        return I18n.strings.notFoundFailure;
    }
  }
}
