import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalValidatePicturesUseCaseImpl implements LocalValidatePicturesUseCase {
  final LocalStorage localStorage;
  final String itemKey;

  LocalValidatePicturesUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainFailure, void>> call(void _) async {
    final fetchResult = await localStorage.fetch(itemKey);
    return await fetchResult.fold(
      /// Left
      (dataFailure) async {
        final deleteResult = await localStorage.delete(itemKey);
        return deleteResult.fold(
          /// Left
          (dataFailure) {
            return Left(DomainFailure(dataFailure.error));
          },

          /// Right
          (_) {
            return Left(DomainFailure(dataFailure.error));
          },
        );
      },

      /// Right
      (data) {
        return PictureMapper().fromMapListToModelList(data).fold(
          /// Left
          (mapperFailure) async {
            final deleteResult = await localStorage.delete(itemKey);
            return deleteResult.fold(
              /// Left
              (dataFailure) {
                return Left(DomainFailure(dataFailure.error));
              },

              /// Right
              (_) {
                return Left(DomainFailure(mapperFailure.error));
              },
            );
          },

          /// Right
          (pictureModelList) {
            return const Right(null);
          },
        );
      },
    );
  }
}
