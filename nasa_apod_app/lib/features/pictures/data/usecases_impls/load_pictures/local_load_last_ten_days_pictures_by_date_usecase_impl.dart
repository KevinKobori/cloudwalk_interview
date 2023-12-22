import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalLoadLastTenDaysPicturesByDateUseCaseImpl
    implements LocalLoadLastTenDaysPicturesByDateUseCase {
  final LocalStorage localStorage;
  final String itemKey;

  LocalLoadLastTenDaysPicturesByDateUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(void _) async {
    final dataResult = await localStorage.fetch(itemKey);
    return dataResult.fold(
      /// Left
      (mapperFailure) => Left(mapperFailure.toDomainFailure),

      /// Right
      (localData) {
        if (localData.isEmpty != false) {
          return const Left(DomainFailure.unexpected);
        }

        final entityListResult =
            PictureMapper().fromMapListToEntityList(localData);
        return entityListResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.toDomainFailure),

          /// Right
          (pictureEntity) => Right(pictureEntity),
        );
      },
    );
  }
}
