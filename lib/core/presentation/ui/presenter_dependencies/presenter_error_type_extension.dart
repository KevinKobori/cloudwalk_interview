import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

extension PresenterErrorTypeExtension on PresenterErrorType {
  String get i18nError {
    switch (this) {
      case PresenterErrorType.unexpected:
        return I18n.strings.unexpectedError;
    }
  }
}
