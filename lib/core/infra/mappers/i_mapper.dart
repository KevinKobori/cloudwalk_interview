
import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

abstract class IMapper {
  InfraException get exception => InfraException(InfraErrorType.invalidData);

  /// Validations
  bool bodyIsAMap(dynamic body) {
    if (body is Map<String, dynamic>) {
      return true;
    }
    return false;
  }

  bool bodyIsAListOfMap(dynamic body) {
    if (body is List<Map<String, String>> || (body is List && body.isEmpty)) {
      return true;
    }
    return false;
  }
}