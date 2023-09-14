import 'dart:convert';

import 'package:nasa_apod_app/core/core.dart';

class JsonMapper {
  /// Validations
  static bool dataIsAMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return true;
    }
    return false;
  }

  static bool dataIsAListOfMap(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      return true;
    }
    return false;
  }

  /// Encoders
  static String tryEncode(dynamic data) {
    try {
      return json.encode(data);
    } catch (_) {
      throw InfraException(InfraErrorType.invalidJson);
    }
  }

  static dynamic tryDecode(dynamic data) {
    try {
      return json.decode(data);
    } catch (_) {
      throw InfraException(InfraErrorType.invalidJson);
    }
  }
}
