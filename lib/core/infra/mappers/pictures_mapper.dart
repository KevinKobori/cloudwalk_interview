import 'dart:convert';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PicturesMapper extends IMapper {
  /// External/Cache > Infra
  Map<String, String> fromJsonToMap(String source) => json.decode(source);

  Result<List<PictureModel>, InfraException> fromMapListToModelList(
      List<Map<String, String>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
          PicturesMapper()
              .fromMapToModel(map)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(exception);
    }
  }

  Result<PictureModel, InfraException> fromMapToModel(Map<String, String> map) {
    try {
      if (!map.keys.toSet().containsAll([
        'date',
        'explanation',
        'hdurl',
        'media_type',
        'service_version',
        'title',
        'url',
      ])) {
        return Error(exception);
      }
      return Success(PictureModel(
        date: map['date']!,
        explanation: map['explanation']!,
        hdurl: map['hdurl']!,
        mediaType: map['media_type']!,
        serviceVersion: map['service_version']!,
        title: map['title']!,
        url: map['url']!,
      ));
    } catch (_) {
      return Error(exception);
    }
  }

  /// Infra > External/Cache
  Result<Map<String, String>, InfraException> fromModelToMap(
      PictureModel model) {
    try {
      return Success(<String, String>{
        'date': model.date,
        'explanation': model.explanation,
        'hdurl': model.hdurl,
        'media_type': model.mediaType,
        'service_version': model.serviceVersion,
        'title': model.title,
        'url': model.url,
      });
    } catch (_) {
      return Error(exception);
    }
  }

  String fromMaptoJson(PictureModel model) =>
      json.encode(fromModelToMap(model));

  /// Data > Domain
  Result<List<PictureEntity>, InfraException> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(pictureModelList.map(
          (pictureModel) =>
              PicturesMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (infraException) =>
                        InfraException(infraException.errorType),
                  ))).toList();
      return Success(result);
    } catch (_) {
      return Error(exception);
    }
  }

  Result<PictureEntity, InfraException> fromModelToEntity(PictureModel model) {
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
    } catch (_) {
      return Error(exception);
    }
  }

  /// Domain > Presenter
  Result<PictureViewModel, InfraException> fromEntityToViewModel(
      PictureEntity entity) {
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
    } catch (_) {
      return Error(exception);
    }
  }
}
