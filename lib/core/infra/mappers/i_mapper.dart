import 'dart:convert';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

abstract class IMapper {
  InfraException get exception => InfraException(InfraErrorType.invalidData);

  /// Validations
  bool dataIsAMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return true;
    }
    return false;
  }

  bool dataIsAListOfMap(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      return true;
    }
    return false;
  }

  String? tryEncode(dynamic data) {
    try {
      return json.encode(data);
    } catch (_) {
      return null;
    }
  }

  dynamic tryDecode(dynamic data) {
    try {
      return json.decode(data);
    } catch (_) {
      return null;
    }
  }
}
