import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalSavePicturesUseCaseImpl implements LocalSavePicturesUseCase {
  final LocalStorage localStorage;
  final String itemKey;

  LocalSavePicturesUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainFailure, void>> call(
      List<PictureEntity> pictureEntityList) async {
    final result = PictureMapper.fromEntityListToJsonList(pictureEntityList);
    return await result.fold(
      /// Left
      (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),

      /// Right
      (picturesJsonList) async {
        final saveResult =
            await localStorage.save(itemKey: itemKey, itemValue: picturesJsonList);
        return saveResult.fold(
          /// Left
          (localStorageFailure) =>
              Left(localStorageFailure.fromLocalStorageToDomain),

          /// Right
          (_) => const Right(null),
        );
      },
    );
  }
}
