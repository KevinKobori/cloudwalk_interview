import 'package:multiple_result/multiple_result.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureMapper {
  InfraErrorType get errorType => InfraErrorType.invalidData;

  /// Data <<< FROM <<< Domain
  Result<PictureModel, DomainException> fromEntityToModel(
      PictureEntity entity) {
    try {
      return Success(PictureModel(
        date: DateTime(
          entity.date.year,
          entity.date.month,
          entity.date.day,
        ),
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  Result<List<PictureModel>, DataException> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureModel>.from(pictureEntityList.map(
          (pictureEntity) =>
              PictureMapper().fromEntityToModel(pictureEntity).when(
                    (pictureModel) => pictureModel,
                    (domainException) => domainException,
                  ))).toList();
      return Success(result);
    } catch (_) {
      return Error(DataException(errorType.dataError));
    }
  }

  /// Data >>> TO >>> Domain
  Result<PictureEntity, DomainException> fromModelToEntity(PictureModel model) {
    try {
      return Success(PictureEntity(
        date: ApodDate(
          day: model.date.day,
          month: model.date.month,
          year: model.date.year,
        ),
        explanation: model.explanation,
        hdurl: model.hdurl,
        mediaType: model.mediaType,
        serviceVersion: model.serviceVersion,
        title: model.title,
        url: model.url,
      ));
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  Result<List<PictureEntity>, DomainException> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(
        pictureModelList.map((pictureModel) {
          return PictureMapper().fromModelToEntity(pictureModel).when(
                (pictureEntity) => pictureEntity,
                (domainException) => domainException,
              );
        }),
      ).toList();
      return Success(result);
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  /// Presentation <<< FROM <<< Domain
  Result<PictureViewModel, PresenterException> fromEntityToViewModel(
      PictureEntity entity) {
    try {
      return Success(PictureViewModel(
        date: entity.date.value,
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch (_) {
      return Error(
          PresenterException(errorType.dataError.domainError.presenterError));
    }
  }

  Result<List<PictureViewModel>, PresenterException>
      fromEntityListToViewModelList(List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureViewModel>.from(
        pictureEntityList.map(
          (pictureEntity) =>
              PictureMapper().fromEntityToViewModel(pictureEntity).when(
                    (pictureEntity) => pictureEntity,
                    (domainException) => domainException,
                  ),
        ),
      ).toList();
      return Success(result);
    } catch (_) {
      return Error(
          PresenterException(errorType.dataError.domainError.presenterError));
    }
  }

  /// Presentation >>> TO >>> Domain
  /// fromViewModelToEntity
  /// fromViewModelListToEntityList
  ///
  /// Infra <<< FROM <<< Data
  Result<Map<String, dynamic>, DataException> fromModelToMap(
      PictureModel model) {
    try {
      return Success(<String, dynamic>{
        'date': '${model.date.year}-${model.date.month}-${model.date.day}',
        'explanation': model.explanation,
        'hdurl': model.hdurl,
        'media_type': model.mediaType,
        'service_version': model.serviceVersion,
        'title': model.title,
        'url': model.url,
      });
    } catch (_) {
      return Error(DataException(errorType.dataError));
    }
  }

  Result<List<Map<String, dynamic>>, InfraException> fromModelListToMapList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PictureMapper()
              .fromModelToMap(pictureModel)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(InfraException(errorType));
    }
  }

  /// Infra >>> TO >>> Data
  Result<PictureModel, DomainException> fromMapToModel(
      Map<String, dynamic> map) {
    try {
      if (!map.keys.toSet().containsAll([
        'date',
        'explanation',
        'media_type',
        'service_version',
        'title',
        'url',
      ])) {
        return Error(DomainException(errorType.dataError.domainError));
      }
      return Success(PictureModel(
        date:
            map['date'] != null ? DateTime.parse(map['date']) : DateTime.now(),
        explanation: map['explanation'] ?? '',
        hdurl: map['hdurl'] ?? '',
        mediaType: map['media_type'] ?? '',
        serviceVersion: map['service_version'] ?? '',
        title: map['title'] ?? '',
        url: map['url'] ?? '',
      ));
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  Result<List<PictureModel>, DataException> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
          PictureMapper()
              .fromMapToModel(map)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(DataException(errorType.dataError));
    }
  }

  /// [REMOVE_OTHERS]
  /// Infra > Domain [REMOVE_THIS]
  PictureEntity fromMapToEntity(Map<String, dynamic> pictureMap) {
    return PictureMapper().fromMapToModel(pictureMap).when(
          (pictureModel) =>
              PictureMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (domainException) => throw domainException,
                  ),
          (domainException) => throw domainException,
        );
  }

  /// Infra > Presenter [REMOVE_THIS]
  PictureViewModel fromMapToViewModel(Map<String, dynamic> pictureMap) {
    try {
      final result =
          PictureMapper().fromEntityToViewModel(fromMapToEntity(pictureMap));
      return result.when(
        (pictureViewModel) => pictureViewModel,
        (presenterException) => throw presenterException,
      );
    } catch (_) {
      throw PresenterException(PresenterErrorType.invalidData);
    }
  }

  /// Infra > Presenter [REMOVE_THIS]
  PictureViewModel fromModelToViewModel(PictureModel pictureModel) {
    try {
      final result = PictureMapper()
          // TODO: NOW
          .fromEntityToViewModel(fromModelToEntity(pictureModel)
              .whenSuccess((success) => success)!);
      return result.when(
        (pictureViewModel) => pictureViewModel,
        (presenterException) => throw presenterException,
      );
    } catch (_) {
      throw PresenterException(PresenterErrorType.invalidData);
    }
  }
}
