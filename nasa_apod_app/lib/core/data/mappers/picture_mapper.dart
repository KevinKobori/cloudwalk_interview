import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureMapper {
  /// Data <<< FROM <<< Domain
  static Either<MapperFailure, PictureModel> fromEntityToModel(
      PictureEntity pictureEntity) {
    return Right(
      PictureModel(
        copyright: pictureEntity.copyright,
        date: DateTime(
          pictureEntity.date.year,
          pictureEntity.date.month,
          pictureEntity.date.day,
        ),
        explanation: pictureEntity.explanation,
        hdurl: pictureEntity.hdurl,
        mediaType: pictureEntity.mediaType,
        serviceVersion: pictureEntity.serviceVersion,
        title: pictureEntity.title,
        url: pictureEntity.url,
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
                // return Left(mapperFailure); // TODO(all): Need to fix this possibility of return an error during the proccess
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
      PictureModel pictureModel) {
    return Right(PictureEntity(
      copyright: pictureModel.copyright,
      date: ApodDate(
        day: pictureModel.date.day,
        month: pictureModel.date.month,
        year: pictureModel.date.year,
      ),
      explanation: pictureModel.explanation,
      hdurl: pictureModel.hdurl,
      mediaType: pictureModel.mediaType,
      serviceVersion: pictureModel.serviceVersion,
      title: pictureModel.title,
      url: pictureModel.url,
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
      PictureEntity pictureEntity) {
    return Right(PictureViewModel(
      copyright: pictureEntity.copyright,
      date:
          '${pictureEntity.date.year}-${pictureEntity.date.month}-${pictureEntity.date.day}',
      explanation: pictureEntity.explanation,
      hdurl: pictureEntity.hdurl,
      mediaType: pictureEntity.mediaType,
      serviceVersion: pictureEntity.serviceVersion,
      title: pictureEntity.title,
      url: pictureEntity.url,
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
  static Either<MapperFailure, Map<String, dynamic>> fromModelToJson(
      PictureModel pictureModel) {
    return Right(pictureModel.toJson()
        // <String, dynamic>{
        //   'copyright': pictureModel.copyright,
        //   'date':
        //       '${pictureModel.date.year}-${pictureModel.date.month}-${pictureModel.date.day}',
        //   'explanation': pictureModel.explanation,
        //   'hdurl': pictureModel.hdurl,
        //   'media_type': pictureModel.mediaType,
        //   'service_version': pictureModel.serviceVersion,
        //   'title': pictureModel.title,
        //   'url': pictureModel.url,
        // }
        );
  }

  static Either<MapperFailure, List<Map<String, dynamic>>>
      fromModelListToJsonList(List<PictureModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PictureMapper.fromModelToJson(pictureModel)
              .fold((l) => l, (r) => r))).toList();
      return Right(result);
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  /// External >>> TO >>> Data
  static Either<MapperFailure, PictureModel> fromJsonToModel(
      Map<String, dynamic> pictureJson) {
    try {
      if (!pictureJson.keys.toSet().containsAll([
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
        copyright: pictureJson['copyright'] ?? '',
        date: pictureJson['date'] != null
            ? DateTime.parse(pictureJson['date'])
            : DateTime.now(),
        explanation: pictureJson['explanation'] ?? '',
        hdurl: pictureJson['hdurl'] ?? '',
        mediaType: pictureJson['media_type'] ?? '',
        serviceVersion: pictureJson['service_version'] ?? '',
        title: pictureJson['title'] ?? '',
        url: pictureJson['url'] ?? '',
      ));
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  static Either<MapperFailure, List<PictureModel>> fromJsonListToModelList(
      List<Map<String, dynamic>> picturesJsonList) {
    try {
      final picturesModelList = List<PictureModel>.from(picturesJsonList.map(
          (pisctureJson) => PictureMapper.fromJsonToModel(pisctureJson).fold(
                (mapperFailure) => mapperFailure,
                (pisctureModel) => pisctureModel,
              ))).toList();
      return Right(picturesModelList);
    } catch (_) {
      return const Left(MapperFailure.conversionError);
    }
  }

  /// [REMOVE_OTHERS]
  /// External > Domain [REMOVE_THIS]
  static Either<MapperFailure, PictureEntity> fromJsonToEntity(
      Map<String, dynamic> pictureJson) {
    return PictureMapper.fromJsonToModel(pictureJson).fold((mapperFailure) {
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
  static Either<MapperFailure, List<PictureEntity>> fromJsonListToEntityList(
      List<Map<String, dynamic>> pictureJson) {
    return PictureMapper.fromJsonListToModelList(pictureJson).fold(
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
  static Either<MapperFailure, PictureViewModel> fromJsonToViewModel(
      Map<String, dynamic> pictureJson) {
    final asd = fromJsonToEntity(pictureJson);

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
      fromEntityListToJsonList(List<PictureEntity> pictureEntityList) {
    return PictureMapper.fromEntityListToModelList(pictureEntityList).fold(
      (mapperFailure) {
        return Left(mapperFailure);
      },
      (pictureModelList) {
        return PictureMapper.fromModelListToJsonList(pictureModelList).fold(
          (mapperFailure) {
            return Left(mapperFailure);
          },
          (picturesJsonList) {
            return Right(picturesJsonList);
          },
        );
      },
    );
  }
}
