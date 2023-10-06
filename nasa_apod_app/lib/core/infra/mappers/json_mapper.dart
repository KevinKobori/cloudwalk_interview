import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class JsonMapper {
  static Either<MapperException, bool> dataIsAMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return const Right(true);
    }
    return Left(MapperException(DataErrorType.invalidData));
  }

  static Either<MapperException, bool> dataIsAListOfMap(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      return const Right(true);
    }
    return Left(MapperException(DataErrorType.invalidData));
  }

  static Either<MapperException, String> tryEncode(dynamic data) {
    try {
      return Right(json.encode(data));
    } catch (_) {
      return Left(MapperException(DataErrorType.invalidData));
    }
  }

  static Either<MapperException, dynamic> tryDecode(dynamic data) {
    try {
      return Right(json.decode(data));
    } catch (_) {
      return Left(MapperException(DataErrorType.invalidData));
    }
  }

  static Either<MapperException, List<Map<String, dynamic>>>
      fromDynamicListToMapList(dynamic data) {
    try {
      final list = List<Map<String, dynamic>>.from(
        (data as List<dynamic>).map(
          (dynamic map) => map as Map<String, dynamic>,
        ),
      ).toList();

      return Right(list);
    } catch (_) {
      return Left(MapperException(DataErrorType.invalidData));
    }
  }
}
