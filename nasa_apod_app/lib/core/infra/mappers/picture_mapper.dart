import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureMapper {
  InfraErrorType get errorType => InfraErrorType.invalidData;

  /// Data <<< FROM <<< Domain
  Either<DomainException, PictureModel> fromEntityToModel(
      PictureEntity entity) {
    try {
      return Right(PictureModel(
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
      return Left(DomainException(errorType.dataError.domainError));
    }
  }

  Either<DataException, List<PictureModel>> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureModel>.from(
        pictureEntityList.map((pictureEntity) {
          return PictureMapper()
              .fromEntityToModel(pictureEntity)
              .fold((l) => l, (r) => r);
        }),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(DataException(errorType.dataError));
    }
  }

  /// Data >>> TO >>> Domain
  Either<DomainException, PictureEntity> fromModelToEntity(PictureModel model) {
    try {
      return Right(PictureEntity(
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
      return Left(DomainException(errorType.dataError.domainError));
    }
  }

  Either<DomainException, List<PictureEntity>> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(
        pictureModelList.map((pictureModel) {
          return PictureMapper().fromModelToEntity(pictureModel).fold(
                (pictureEntity) => pictureEntity,
                (domainException) => domainException,
              );
        }),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(DomainException(errorType.dataError.domainError));
    }
  }

  /// Presentation <<< FROM <<< Domain
  Either<PresenterException, PictureViewModel> fromEntityToViewModel(
      PictureEntity entity) {
    try {
      return Right(PictureViewModel(
        date: entity.date.value,
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch (_) {
      return Left(
          PresenterException(errorType.dataError.domainError.presenterError));
    }
  }

  Either<PresenterException, List<PictureViewModel>>
      fromEntityListToViewModelList(List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureViewModel>.from(
        pictureEntityList.map(
          (pictureEntity) =>
              PictureMapper().fromEntityToViewModel(pictureEntity).fold(
                    (pictureEntity) => pictureEntity,
                    (domainException) => domainException,
                  ),
        ),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(
          PresenterException(errorType.dataError.domainError.presenterError));
    }
  }

  /// Presentation >>> TO >>> Domain
  /// fromViewModelToEntity
  /// fromViewModelListToEntityList
  ///
  /// Infra <<< FROM <<< Data
  Either<DataException, Map<String, dynamic>> fromModelToMap(
      PictureModel model) {
    try {
      return Right(<String, dynamic>{
        'date': '${model.date.year}-${model.date.month}-${model.date.day}',
        'explanation': model.explanation,
        'hdurl': model.hdurl,
        'media_type': model.mediaType,
        'service_version': model.serviceVersion,
        'title': model.title,
        'url': model.url,
      });
    } catch (_) {
      return Left(DataException(errorType.dataError));
    }
  }

  Either<InfraException, List<Map<String, dynamic>>> fromModelListToMapList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PictureMapper()
              .fromModelToMap(pictureModel)
              .fold((l) => l, (r) => r))).toList();
      return Right(result);
    } catch (_) {
      return Left(InfraException(errorType));
    }
  }

  /// Infra >>> TO >>> Data
  Either<DomainException, PictureModel> fromMapToModel(
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
        return Left(DomainException(errorType.dataError.domainError));
      }
      return Right(PictureModel(
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
      return Left(DomainException(errorType.dataError.domainError));
    }
  }

  Either<DataException, List<PictureModel>> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
              PictureMapper().fromMapToModel(map).fold((l) => l, (r) => r)))
          .toList();
      return Right(result);
    } catch (_) {
      return Left(DataException(errorType.dataError));
    }
  }

  /// [REMOVE_OTHERS]
  /// Infra > Domain [REMOVE_THIS]
  PictureEntity fromMapToEntity(Map<String, dynamic> pictureMap) {
    return PictureMapper().fromMapToModel(pictureMap).fold(
          (domainException) => throw domainException,
          (pictureModel) =>
              PictureMapper().fromModelToEntity(pictureModel).fold(
                    (domainException) => throw domainException,
                    (pictureEntity) => pictureEntity,
                  ),
        );
  }

  /// [REMOVE_OTHERS]
  List<PictureEntity> fromMapListToEntityList(List<Map<String, dynamic>> data) {
    return PictureMapper().fromMapListToModelList(data).fold(
      (dataException) {
        throw dataException;
      },
      (pictureModelList) {
        return PictureMapper().fromModelListToEntityList(pictureModelList).fold(
            (domainException) {
          throw domainException;
        }, (pictureEntityList) {
          return pictureEntityList;
        });
      },
    );
  }

  /// Infra > Presenter [REMOVE_THIS]
  Either<PresenterException, PictureViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) {
    try {
      final result =
          PictureMapper().fromEntityToViewModel(fromMapToEntity(pictureMap));
      return result;
    } catch (_) {
      throw PresenterException(PresenterErrorType.invalidData);
    }
  }

  /// Infra > Presenter [REMOVE_THIS]
  Either<PresenterException, PictureViewModel> fromModelToViewModel(
      PictureModel pictureModel) {
    try {
      return fromModelToEntity(pictureModel).fold(
        (domainException) {
          return Left(
              PresenterException(domainException.errorType.presenterError));
        },
        (pictureEntity) {
          return PictureMapper()
              // TODO: NOW
              .fromEntityToViewModel(pictureEntity);
        },
      );
    } catch (_) {
      throw PresenterException(PresenterErrorType.invalidData);
    }
  }
}
