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
    final result = PictureMapper().fromEntityListToMapList(pictureEntityList);
    return await result.fold(
      /// Left
      (mapperFailure) {
        return Left(DomainFailure(mapperFailure.error));
      },

      /// Right
      (mapList) async {
        final saveResult =
            await localStorage.save(itemKey: itemKey, itemValue: mapList);
        return saveResult.fold(
          /// Left
          (dataFailure) {
            return Left(DomainFailure(dataFailure.error));
          },
          (_) {
            /// Right
            return const Right(null);
          },
        );
      },
    );
  }
}
