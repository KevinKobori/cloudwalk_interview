import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureMapper {
  MapperFailure get error => MapperFailure.conversionError;

  /// Data <<< FROM <<< Domain
  Either<MapperFailure, PictureModel> fromEntityToModel(PictureEntity entity) {
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

  Either<MapperFailure, List<PictureModel>> fromEntityListToModelList(
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
      return Left(error);
    }
  }

  /// Data >>> TO >>> Domain
  Either<MapperFailure, PictureEntity> fromModelToEntity(PictureModel model) {
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

  Either<MapperFailure, List<PictureEntity>> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(
        pictureModelList.map((pictureModel) {
          return PictureMapper().fromModelToEntity(pictureModel).fold(
                (mapperFailure) => mapperFailure,
                (pictureEntity) => pictureEntity,
              );
        }),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(error);
    }
  }

  /// Presentation <<< FROM <<< Domain
  Either<MapperFailure, PictureViewModel> fromEntityToViewModel(
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

  Either<MapperFailure, List<PictureViewModel>> fromEntityListToViewModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureViewModel>.from(
        pictureEntityList.map(
          (pictureEntity) =>
              PictureMapper().fromEntityToViewModel(pictureEntity).fold(
                    (pictureEntity) => pictureEntity,
                    (mapperFailure) => mapperFailure,
                  ),
        ),
      ).toList();
      return Right(result);
    } catch (_) {
      return Left(error);
    }
  }

  /// Presentation >>> TO >>> Domain
  /// fromViewModelToEntity
  /// fromViewModelListToEntityList
  ///
  /// External <<< FROM <<< Data
  Either<MapperFailure, Map<String, dynamic>> fromModelToMap(
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

  Either<MapperFailure, List<Map<String, dynamic>>> fromModelListToMapList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PictureMapper()
              .fromModelToMap(pictureModel)
              .fold((l) => l, (r) => r))).toList();
      return Right(result);
    } catch (_) {
      return Left(error);
    }
  }

  /// External >>> TO >>> Data
  Either<MapperFailure, PictureModel> fromMapToModel(Map<String, dynamic> map) {
    try {
      if (!map.keys.toSet().containsAll([
        'date',
        'explanation',
        'media_type',
        'service_version',
        'title',
        'url',
      ])) {
        return Left(error);
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
      return Left(error);
    }
  }

  Either<MapperFailure, List<PictureModel>> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
              PictureMapper().fromMapToModel(map).fold((l) => l, (r) => r)))
          .toList();
      return Right(result);
    } catch (_) {
      return Left(error);
    }
  }

  /// [REMOVE_OTHERS]
  /// External > Domain [REMOVE_THIS]
  Either<MapperFailure, PictureEntity> fromMapToEntity(
      Map<String, dynamic> pictureMap) {
    return PictureMapper().fromMapToModel(pictureMap).fold((mapperFailure) {
      return Left(mapperFailure);
    }, (pictureModel) {
      return PictureMapper().fromModelToEntity(pictureModel).fold(
        (mapperFailure) {
          return Left(mapperFailure);
        },
        (pictureEntity) {
          return Right(pictureEntity);
        },
      );
    });
  }

  /// [REMOVE_OTHERS]
  Either<MapperFailure, List<PictureEntity>> fromMapListToEntityList(
      List<Map<String, dynamic>> data) {
    return PictureMapper().fromMapListToModelList(data).fold(
      /// Left
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureModelList) {
        return PictureMapper().fromModelListToEntityList(pictureModelList).fold(
            (mapperFailure) {
          return Left(mapperFailure);
        }, (pictureEntityList) {
          return Right(pictureEntityList);
        });
      },
    );
  }

  /// External > Presenter [REMOVE_THIS]
  Either<MapperFailure, PictureViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) {
    final asd = fromMapToEntity(pictureMap);

    return asd.fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureEntity) {
        return PictureMapper().fromEntityToViewModel(pictureEntity);
      },
    );
  }

  /// External > Presenter [REMOVE_THIS]
  Either<MapperFailure, PictureViewModel> fromModelToViewModel(
      PictureModel pictureModel) {
    return fromModelToEntity(pictureModel).fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureEntity) {
        return PictureMapper().fromEntityToViewModel(pictureEntity);
      },
    );
  }

  /// Domain > External [REMOVE_THIS]
  Either<MapperFailure, List<Map<String, dynamic>>> fromEntityListToMapList(
      List<PictureEntity> pictureEntityList) {
    return PictureMapper().fromEntityListToModelList(pictureEntityList).fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureModelList) {
        return PictureMapper().fromModelListToMapList(pictureModelList).fold(
          (mapperFailure) {
            return Left(mapperFailure);
          },
          (mapList) {
            return Right(mapList);
          },
        );
      },
    );
  }
}
