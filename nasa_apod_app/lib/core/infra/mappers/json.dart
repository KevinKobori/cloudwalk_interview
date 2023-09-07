import 'dart:convert';

class Json {
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
  static String? tryEncode(dynamic data) {
    try {
      return json.encode(data);
    } catch (_) {
      return null;
    }
  }

  static dynamic tryDecode(dynamic data) {
    try {
      return json.decode(data);
    } catch (_) {
      return null;
    }
  }
}
