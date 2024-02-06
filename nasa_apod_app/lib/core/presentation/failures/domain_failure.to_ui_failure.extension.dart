import 'package:nasa_apod_app/nasa_apod_app.dart';

extension DomainFailureToUIFailureExtension on DomainFailure {
  String get toUIFailure {
    switch (this) {
      case DomainFailure.notHaveInternetConnection:
        return I18n.strings.notHaveInternetConnectionFailure;
      case DomainFailure.internalServerError:
        return I18n.strings.internalServerErrorFailure;
      case DomainFailure.invalidData:
        return I18n.strings.invalidDataFailure;
      case DomainFailure.notFound:
        return I18n.strings.notFoundFailure;
      case DomainFailure.unexpected:
        return I18n.strings.unexpectedFailure;
    }
  }
}
