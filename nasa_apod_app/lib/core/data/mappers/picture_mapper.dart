import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureMapper {
  /// Data <<< FROM <<< Domain
  static Either<MapperFailure, PictureModel> fromEntityToModel(
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

  static Either<MapperFailure, List<PictureModel>> fromEntityListToModelList(
      List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureModel>.from(
        pictureEntityList.map(
          (pictureEntity) {
            final pictureModelResult =
                PictureMapper.fromEntityToModel(pictureEntity);
            return pictureModelResult.fold(
              /// Left
              (mapperFailure) {
                return;
                // return Left(mapperFailure); // TODO: Need to fix this possibility of return an error during the proccess
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
      return const Left(MapperFailure.conversionError);
    }
  }

  /// Data >>> TO >>> Domain
  static Either<MapperFailure, PictureEntity> fromModelToEntity(
      PictureModel model) {
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

  static Either<MapperFailure, List<PictureEntity>> fromModelListToEntityList(
      List<PictureModel> pictureModelList) {
    try {
      final result = List<PictureEntity>.from(
        pictureModelList.map((pictureModel) {
          return PictureMapper.fromModelToEntity(pictureModel).fold(
                (mapperFailure) => mapperFailure,
                (pictureEntity) => pictureEntity,
              );
        }),
      ).toList();
      return Right(result);
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  /// Presentation <<< FROM <<< Domain
  static Either<MapperFailure, PictureViewModel> fromEntityToViewModel(
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

  static Either<MapperFailure, List<PictureViewModel>>
      fromEntityListToViewModelList(List<PictureEntity> pictureEntityList) {
    try {
      final result = List<PictureViewModel>.from(
        pictureEntityList.map(
          (pictureEntity) =>
              PictureMapper.fromEntityToViewModel(pictureEntity).fold(
                    (pictureEntity) => pictureEntity,
                    (mapperFailure) => mapperFailure,
                  ),
        ),
      ).toList();
      return Right(result);
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  /// Presentation >>> TO >>> Domain
  /// fromViewModelToEntity
  /// fromViewModelListToEntityList
  ///
  /// External <<< FROM <<< Data
  static Either<MapperFailure, Map<String, dynamic>> fromModelToMap(
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

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromModelListToMapList(List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PictureMapper
              .fromModelToMap(pictureModel)
              .fold((l) => l, (r) => r))).toList();
      return Right(result);
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  /// External >>> TO >>> Data
  static Either<MapperFailure, PictureModel> fromMapToModel(
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
        return const Left(MapperFailure.conversionError);
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
      return const Left(MapperFailure.conversionError);
    }
  }

  static Either<MapperFailure, List<PictureModel>> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<PictureModel>.from(mapList.map((map) =>
              PictureMapper.fromMapToModel(map).fold((l) => l, (r) => r)))
          .toList();
      return Right(result);
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  /// [REMOVE_OTHERS]
  /// External > Domain [REMOVE_THIS]
  static Either<MapperFailure, PictureEntity> fromMapToEntity(
      Map<String, dynamic> pictureMap) {
    return PictureMapper.fromMapToModel(pictureMap).fold((mapperFailure) {
      return Left(mapperFailure);
    }, (pictureModel) {
      return PictureMapper.fromModelToEntity(pictureModel).fold(
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
  static Either<MapperFailure, List<PictureEntity>> fromMapListToEntityList(
      List<Map<String, dynamic>> data) {
    return PictureMapper.fromMapListToModelList(data).fold(
      /// Left
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureModelList) {
        return PictureMapper.fromModelListToEntityList(pictureModelList).fold(
            (mapperFailure) {
          return Left(mapperFailure);
        }, (pictureEntityList) {
          return Right(pictureEntityList);
        });
      },
    );
  }

  /// External > Presenter [REMOVE_THIS]
  static Either<MapperFailure, PictureViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) {
    final asd = fromMapToEntity(pictureMap);

    return asd.fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureEntity) {
        return PictureMapper.fromEntityToViewModel(pictureEntity);
      },
    );
  }

  /// External > Presenter [REMOVE_THIS]
  static Either<MapperFailure, PictureViewModel> fromModelToViewModel(
      PictureModel pictureModel) {
    return fromModelToEntity(pictureModel).fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureEntity) {
        return PictureMapper.fromEntityToViewModel(pictureEntity);
      },
    );
  }

  /// Domain > External [REMOVE_THIS]
  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromEntityListToMapList(List<PictureEntity> pictureEntityList) {
    return PictureMapper.fromEntityListToModelList(pictureEntityList).fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureModelList) {
        return PictureMapper.fromModelListToMapList(pictureModelList).fold(
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
