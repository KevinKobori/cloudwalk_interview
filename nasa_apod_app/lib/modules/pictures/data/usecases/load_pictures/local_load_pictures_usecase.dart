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
        throw DomainException(DomainErrorType.unexpected);
      }

      return PictureMapper().fromMapListToEntityList(data);
    } catch (_) {
      throw DomainException(DomainErrorType.unexpected);
    }
  }

  @override
  Future<Either<DomainException, void>> validateLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      PictureMapper().fromMapListToEntityList(data);
      return const Right(null);
    } catch (_) {
      await localStorage.delete(itemKey);
      return Left(DomainException(DomainErrorType.unexpected));
    }
  }

  @override
  Future<Either<DomainException, void>> saveLastTenDaysData(
      List<PictureEntity> pictureEntityList) async {
    try {
      final result = PictureMapper().fromEntityListToMapList(pictureEntityList);

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
    } catch (error) { // TODO: NOW - WHY REMOVING THIS UNIT TEST BREAKS
      return Left(DomainException(DomainErrorType.unexpected));
    }
  }
}
