import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

extension DomainErrorTypeExtension on DomainErrorType {
  PresenterErrorType get presenterError {
    switch (this) {
      case DomainErrorType.unexpected:
        return PresenterErrorType.unexpected;
    }
  }
}
