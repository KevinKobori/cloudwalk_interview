import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureMapper {
  /// External/Cache > Infra
  Result<PictureModel, Exception> fromMapToModel(Map<String, String> map) {
    try {
      if (!map.keys
        .toSet()
        .containsAll([
          'date',
          'explanation',
          'hdurl',
          'title',
          'url',
        ])) {
        return Error(Exception());
      }
      return Success(PictureModel(
        date: map['date']!,
        explanation: map['explanation']!,
        hdurl: map['hdurl']!,
        mediaType: map['mediaType'] ?? '',
        serviceVersion: map['serviceVersion'] ?? '',
        title: map['title']!,
        url: map['url']!,
      ));
    } catch(_) {
      return Error(Exception());
    }
  }

  /// Infra > External/Cache
  Result<Map<String, String>, Exception> fromModelToMap(PictureModel model) {
    try {    
      return Success(<String, String>{
        'date': model.date,
        'explanation': model.explanation,
        'hdurl': model.hdurl,
        'mediaType': model.mediaType,
        'serviceVersion': model.serviceVersion,
        'title': model.title,
        'url': model.url,
      });
    } catch(_) {
      return Error(Exception());
    }
  }

  /// Data > Domain
  Result<PictureEntity, Exception> fromModelToEntity(PictureModel model) {
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
      return Error(Exception());
    }
  }

  /// Domain > Presenter
  Result<PictureViewModel, Exception> fromEntityToViewModel(PictureEntity entity) {
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
      return Error(Exception());
    }
  }
}