import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PicturesMapper {
  InfraErrorType get errorType => InfraErrorType.invalidData;

  /// Infra > Data
  Result<List<ApodObjectModel>, DomainException> fromMapListToModelList(
      List<Map<String, dynamic>> mapList) {
    try {
      final result = List<ApodObjectModel>.from(mapList.map((map) =>
          PicturesMapper()
              .fromMapToModel(map)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  /// Infra > Data
  Result<ApodObjectModel, DomainException> fromMapToModel(
      Map<String, dynamic> map) {
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
        return Error(DomainException(errorType.dataError.domainError));
      }
      return Success(ApodObjectModel(
        date: map['date']!,
        explanation: map['explanation']!,
        hdurl: map['hdurl']!,
        mediaType: map['media_type']!,
        serviceVersion: map['service_version']!,
        title: map['title']!,
        url: map['url']!,
      ));
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  /// Infra > Domain [REMOVE_THIS]
  Future<ApodObjectEntity> fromMapToEntity(
      Map<String, dynamic> pictureMap) async {
    return await PicturesMapper().fromMapToModel(pictureMap).when(
          (pictureModel) async =>
              await PicturesMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (domainException) => throw domainException,
                  ),
          (domainException) =>
              throw domainException,
        );
  }

  /// Infra > Presenter [REMOVE_THIS]
  Future<ApodObjectViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) async {
    try {
      final result = PicturesMapper()
          .fromEntityToViewModel(await fromMapToEntity(pictureMap));
      return await result.when(
        (pictureViewModel) => pictureViewModel,
        (presenterException) => throw presenterException,
      );
    } catch (_) {
      throw PresenterException(PresenterErrorType.invalidData);
    }
  }

  /// Infra > Presenter [REMOVE_THIS]
  Future<ApodObjectViewModel> fromModelToViewModel(
      ApodObjectModel pictureModel) async {
    try {
      final result = PicturesMapper()
      // TODO: NOW
          .fromEntityToViewModel(await fromModelToEntity(pictureModel).whenSuccess((success) => success)!);
      return await result.when(
        (pictureViewModel) => pictureViewModel,
        (presenterException) => throw presenterException,
      );
    } catch (_) {
      throw PresenterException(PresenterErrorType.invalidData);
    }
  }

  /// Data > Domain
  Result<List<ApodObjectEntity>, DomainException> fromModelListToEntityList(
      List<ApodObjectModel> pictureModelList) {
    try {
      final result = List<ApodObjectEntity>.from(
        pictureModelList.map(
          (pictureModel) =>
              PicturesMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (domainException) => domainException,
                  ),
        ),
      ).toList();
      return Success(result);
    } catch (_) {
      return Error(DomainException(errorType.dataError.domainError));
    }
  }

  /// Data > Domain
  Result<ApodObjectEntity, DomainException> fromModelToEntity(
      ApodObjectModel model) {
    try {
      return Success(ApodObjectEntity(
        date: model.date,
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

  /// Data > Infra
  Result<List<Map<String, dynamic>>, InfraException> fromModelListToMapList(
      List<ApodObjectModel> pictureModelList) {
    try {
      final result = List<Map<String, dynamic>>.from(pictureModelList.map(
          (pictureModel) => PicturesMapper()
              .fromModelToMap(pictureModel)
              .whenSuccess((success) => success))).toList();
      return Success(result);
    } catch (_) {
      return Error(InfraException(errorType));
    }
  }

  /// Data > Infra
  Result<Map<String, dynamic>, DataException> fromModelToMap(
      ApodObjectModel model) {
    try {
      return Success(<String, dynamic>{
        'date': model.date,
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

  /// Domain > Presenter
  Result<ApodObjectViewModel, PresenterException> fromEntityToViewModel(
      ApodObjectEntity entity) {
    try {
      return Success(ApodObjectViewModel(
        date: entity.date.value,
        explanation: entity.explanation,
        hdurl: entity.hdurl,
        mediaType: entity.mediaType,
        serviceVersion: entity.serviceVersion,
        title: entity.title,
        url: entity.url,
      ));
    } catch (_) {
      return Error(PresenterException(
          errorType.dataError.domainError.presentationError));
    }
  }

  /// Domain > Data
  Result<ApodObjectModel, DomainException> fromEntityToModel(
      ApodObjectEntity entity) {
    try {
      return Success(ApodObjectModel(
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

  /// Domain > Data
  Result<List<ApodObjectModel>, DataException> fromEntityListToModelList(
      List<ApodObjectEntity> pictureEntityList) {
    try {
      final result = List<ApodObjectModel>.from(pictureEntityList.map(
          (pictureEntity) =>
              PicturesMapper().fromEntityToModel(pictureEntity).when(
                    (pictureModel) => pictureModel,
                    (domainException) => domainException,
                  ))).toList();
      return Success(result);
    } catch (_) {
      return Error(DataException(errorType.dataError));
    }
  }
}
