import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureMapper {
  DataErrorType get error => DataErrorType.invalidData;

  /// Data <<< FROM <<< Domain
  Either<MapperException, PictureModel> fromEntityToModel(
      PictureEntity entity) {
    return Right(
      PictureModel(
        copyright: entity.copyright,
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
      ),
    );
  }

  Either<MapperException, List<PictureModel>> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureModel>.from(
        pictureEntityList.map(
          (pictureEntity) {
            final pictureModelResult =
                PictureMapper().fromEntityToModel(pictureEntity);
            return pictureModelResult.fold(
              /// Left
              (_) {
                return;
              },

              /// Right
              (pictureModel) {
                return pictureModel;
              },
            );
          },
        ),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(MapperException(error));
    }
  }

  /// Data >>> TO >>> Domain
  Either<DomainException, PictureEntity> fromModelToEntity(PictureModel model) {
    return Right(PictureEntity(
      copyright: model.copyright,
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
  }

  Either<DomainException, List<PictureEntity>> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(
        pictureModelList.map((pictureModel) {
          return PictureMapper().fromModelToEntity(pictureModel).fold(
                (domainException) => domainException,
                (pictureEntity) => pictureEntity,
              );
        }),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(DomainException(error.domainError));
    }
  }

  /// Presentation <<< FROM <<< Domain
  Either<DomainException, PictureViewModel> fromEntityToViewModel(
      PictureEntity entity) {
    return Right(PictureViewModel(
      copyright: entity.copyright,
      date: entity.date.value,
      explanation: entity.explanation,
      hdurl: entity.hdurl,
      mediaType: entity.mediaType,
      serviceVersion: entity.serviceVersion,
      title: entity.title,
      url: entity.url,
    ));
  }

  Either<DomainException, List<PictureViewModel>> fromEntityListToViewModelList(
      List<PictureEntity> pictureEntityList) {
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
      return Left(DomainException(error.domainError));
    }
  }

  /// Presentation >>> TO >>> Domain
  /// fromViewModelToEntity
  /// fromViewModelListToEntityList
  ///
  /// Infra <<< FROM <<< Data
  Either<MapperException, Map<String, dynamic>> fromModelToMap(
      PictureModel model) {
    return Right(<String, dynamic>{
      'copyright': model.copyright,
      'date': '${model.date.year}-${model.date.month}-${model.date.day}',
      'explanation': model.explanation,
      'hdurl': model.hdurl,
      'media_type': model.mediaType,
      'service_version': model.serviceVersion,
      'title': model.title,
      'url': model.url,
    });
  }

  Either<MapperException, List<Map<String, dynamic>>> fromModelListToMapList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PictureMapper()
              .fromModelToMap(pictureModel)
              .fold((l) => l, (r) => r))).toList();
      return Right(result);
    } catch (_) {
      return Left(MapperException(error));
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
        return Left(DomainException(error.domainError));
      }
      return Right(PictureModel(
        copyright: map['copyright'] ?? '',
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
      return Left(DomainException(error.domainError));
    }
  }

  Either<MapperException, List<PictureModel>> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
              PictureMapper().fromMapToModel(map).fold((l) => l, (r) => r)))
          .toList();
      return Right(result);
    } catch (_) {
      return Left(MapperException(error));
    }
  }

  /// [REMOVE_OTHERS]
  /// Infra > Domain [REMOVE_THIS]
  Either<DomainException, PictureEntity> fromMapToEntity(
      Map<String, dynamic> pictureMap) {
    return PictureMapper().fromMapToModel(pictureMap).fold((domainException) {
      return Left(domainException);
    }, (pictureModel) {
      return PictureMapper().fromModelToEntity(pictureModel).fold(
        (domainException) {
          return Left(domainException);
        },
        (pictureEntity) {
          return Right(pictureEntity);
        },
      );
    });
  }

  /// [REMOVE_OTHERS]
  Either<DomainException, List<PictureEntity>> fromMapListToEntityList(
      List<Map<String, dynamic>> data) {
    return PictureMapper().fromMapListToModelList(data).fold(
      /// Left
      (mapperException) {
        return Left(DomainException(mapperException.error.domainError));
      },
      (pictureModelList) {
        return PictureMapper().fromModelListToEntityList(pictureModelList).fold(
            (domainException) {
          return Left(domainException);
        }, (pictureEntityList) {
          return Right(pictureEntityList);
        });
      },
    );
  }

  /// Infra > Presenter [REMOVE_THIS]
  Either<DomainException, PictureViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) {
    final asd = fromMapToEntity(pictureMap);

    return asd.fold(
      (domainException) {
        return Left(DomainException(domainException.error));
      },
      (pictureEntity) {
        return PictureMapper().fromEntityToViewModel(pictureEntity);
      },
    );
  }

  /// Infra > Presenter [REMOVE_THIS]
  Either<DomainException, PictureViewModel> fromModelToViewModel(
      PictureModel pictureModel) {
    return fromModelToEntity(pictureModel).fold(
      (domainException) {
        return Left(DomainException(domainException.error));
      },
      (pictureEntity) {
        return PictureMapper().fromEntityToViewModel(pictureEntity);
      },
    );
  }

  /// Domain > Infra [REMOVE_THIS]
  Either<MapperException, List<Map<String, dynamic>>> fromEntityListToMapList(
      List<PictureEntity> pictureEntityList) {
    return PictureMapper().fromEntityListToModelList(pictureEntityList).fold(
      (mapperException) {
        return Left(MapperException(mapperException.error));
      },
      (pictureModelList) {
        return PictureMapper().fromModelListToMapList(pictureModelList).fold(
          (mapperException) {
            return Left(mapperException);
          },
          (mapList) {
            return Right(mapList);
          },
        );
      },
    );
  }
}
