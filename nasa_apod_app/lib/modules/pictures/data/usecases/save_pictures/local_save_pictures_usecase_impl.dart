import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalSavePicturesUseCaseImpl implements LocalSavePicturesUseCase {
  final ILocalStorage localStorage;
  final String itemKey;

  LocalSavePicturesUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainException, void>> call(
      List<PictureEntity> pictureEntityList) async {
    final result = PictureMapper().fromEntityListToMapList(pictureEntityList);
    return await result.fold(
      /// Left
      (infraException) {
        return Left(
            DomainException(infraException.errorType.dataError.domainError));
      },

      /// Right
      (mapList) async {
        final saveResult =
            await localStorage.save(itemKey: itemKey, itemValue: mapList);
        return saveResult.fold(
          /// Left
          (infraException) {
            return Left(DomainException(
                infraException.errorType.dataError.domainError));
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
