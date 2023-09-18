import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalLoadPicturesUseCase implements ILocalLoadPicturesUseCase {
  final ILocalStorage localStorage;

  LocalLoadPicturesUseCase({required this.localStorage});

  String itemKey = 'apod_objects';

  @override
  Future<Either<DomainException, List<PictureEntity>>>
      loadLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      if (data?.isEmpty != false) {
        return Left(DomainException(DomainErrorType.unexpected));
      }

      return PictureMapper().fromMapListToEntityList(data);
    } catch (_) {
      return Left(DomainException(DomainErrorType.unexpected));
    }
  }

  @override
  Future<Either<DomainException, void>> validateLastTenDaysData() async {
    try {
      await localStorage.fetch(itemKey);
      return const Right(null);
    } catch (_) {
      try {
        await localStorage.delete(itemKey);
        return Left(
            DomainException(InfraErrorType.invalidJson.dataError.domainError));
      } catch (_) {
        return Left(DomainException(DomainErrorType.unexpected));
      }
    }
  }

  @override
  Future<Either<DomainException, void>> saveLastTenDaysData(
      List<PictureEntity> pictureEntityList) async {
    final result = PictureMapper().fromEntityListToMapList(pictureEntityList);
    try {
      return await result.fold(
        (infraException) {
          return Left(
              DomainException(infraException.errorType.dataError.domainError));
        },
        (mapList) async {
          await localStorage.save(key: itemKey, value: mapList);
          return const Right(null);
        },
      );
    } catch (error) {
      return Left(DomainException(DomainErrorType.unexpected));
    }
  }
}
