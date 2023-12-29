import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fluttely_core/fluttely_core.dart';

class JsonMapper {
  static Either<MapperFailure, bool> dataIsAMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return const Right(true);
    }
    return const Left(MapperFailure.invalidJsonFormat);
  }

  static Either<MapperFailure, bool> dataIsAListOfMap(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      return const Right(true);
    }
    return const Left(MapperFailure.invalidJsonFormat);
  }

  static Either<MapperFailure, String> tryEncode(Map<String, dynamic> data) {
    try {
      return Right(json.encode(data));
    } catch (_) {
      return const Left(MapperFailure.invalidJsonFormat);
    }
  }

  static Either<MapperFailure, dynamic> tryDecode(String data) {
    try {
      return Right(json.decode(data));
    } catch (_) {
      return const Left(MapperFailure.invalidJsonFormat);
    }
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromDynamicListToJsonList(dynamic picturesJsonList) {
    try {
      final list = List<Map<String, dynamic>>.from(
        (picturesJsonList as List<dynamic>).map(
          (dynamic pictureJson) => pictureJson as Map<String, dynamic>,
        ),
      ).toList();

      return Right(list);
    } catch (_) {
      return const Left(MapperFailure.invalidJsonFormat);
    }
  }
}
