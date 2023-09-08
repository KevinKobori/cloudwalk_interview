import 'package:nasa_apod_app/nasa_apod_app.dart';

extension InfraErrorTypeExtension on InfraErrorType {
  DataErrorType get dataError {
    switch (this) {
      case InfraErrorType.unexpected:
        return DataErrorType.unexpected;
      case InfraErrorType.invalidData:
        return DataErrorType.invalidData;
      case InfraErrorType.invalidJson:
        return DataErrorType.invalidData;
      case InfraErrorType.notFound:
        return DataErrorType.notFound;
    }
  }
}
