import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/core/core.dart';

class JsonMapper {
  static Either<InfraException, bool> dataIsAMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return const Right(true);
    }
    return Left(InfraException(InfraErrorType.invalidData));
  }

  static Either<InfraException, bool> dataIsAListOfMap(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      return const Right(true);
    }
    return Left(InfraException(InfraErrorType.invalidData));
  }

  static Either<InfraException, String> tryEncode(dynamic data) {
    try {
      return Right(json.encode(data));
    } catch (_) {
      return Left(InfraException(InfraErrorType.invalidJson));
    }
  }

  static Either<InfraException, dynamic> tryDecode(dynamic data) {
    try {
      return Right(json.decode(data));
    } catch (_) {
      return Left(InfraException(InfraErrorType.invalidJson));
    }
  }

  static Either<InfraException, List<Map<String, dynamic>>> fromDynamicListToMapList(
      dynamic data) {
    try {
      final list = List<Map<String, dynamic>>.from(
        (data as List<dynamic>).map(
          (dynamic map) => map as Map<String, dynamic>,
        ),
      ).toList();
      
      return Right(list);
    } catch (_) {
      return Left(InfraException(InfraErrorType.invalidJson));
    }
  }
}
