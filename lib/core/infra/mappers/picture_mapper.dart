import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureMapper {
  static final pictureMapperException = InfraException(InfraErrorType.invalidData);

  static bool bodyIsAMap(dynamic body) {
    if (body is Map<String, dynamic>) {
      return true;
    }
    return false;
  }

  static bool bodyIsAListOfMap(dynamic body) {
    if (body is List<Map<String, String>> || (body is List && body.isEmpty)) {
      return true;
    }
    return false;
  }

  /// External/Cache > Infra
  static Result<PictureModel, InfraException> fromMapToModel(Map<String, String> map) {
    try {
      if (!map.keys
        .toSet()
        .containsAll([
          'date',
          'explanation',
          'hdurl',
          // 'media_Type',
          // 'service_version',
          'title',
          'url',
        ])) {
        return Error(pictureMapperException);
      }
      return Success(PictureModel(
        date: map['date']!,
        explanation: map['explanation']!,
        hdurl: map['hdurl']!,
        mediaType: map['media_type']!,
        serviceVersion: map['service_version'] ?? '',
        title: map['title']!,
        url: map['url']!,
      ));
    } catch(_) {
      return Error(pictureMapperException);
    }
  }

  /// Infra > External/Cache
  static Result<Map<String, String>, InfraException> fromModelToMap(PictureModel model) {
    try {    
      return Success(<String, String>{
        'date': model.date,
        'explanation': model.explanation,
        'hdurl': model.hdurl,
        'media_Type': model.mediaType,
        'service_version': model.serviceVersion,
        'title': model.title,
        'url': model.url,
      });
    } catch(_) {
      return Error(pictureMapperException);
    }
  }

  /// Data > Domain
  static Result<PictureEntity, InfraException> fromModelToEntity(PictureModel model) {
    try {
      return Success(PictureEntity(
        date: model.date,
        explanation: model.explanation,
        hdurl: model.hdurl,
        mediaType: model.mediaType,
        serviceVersion: model.serviceVersion,
        title: model.title,
        url: model.url,
      ));
    } catch(_) {
      return Error(pictureMapperException);
    }
  }

  /// Domain > Presenter
  static Result<PictureViewModel, InfraException> fromEntityToViewModel(PictureEntity entity) {
    try {
      return Success(PictureViewModel(
        date: entity.date,
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch(_) {
      return Error(pictureMapperException);
    }
  }
}