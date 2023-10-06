import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalValidatePicturesUseCaseImpl implements LocalValidatePicturesUseCase {
  final ILocalStorage localStorage;
  final String itemKey;

  LocalValidatePicturesUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainException, void>> call(void _) async {
    final fetchResult = await localStorage.fetch(itemKey);
    return await fetchResult.fold(
      /// Left
      (dataException) async {
        final deleteResult = await localStorage.delete(itemKey);
        return deleteResult.fold(
          /// Left
          (dataException) {
            return Left(DomainException(dataException.error.domainError));
          },

          /// Right
          (_) {
            return Left(DomainException(dataException.error.domainError));
          },
        );
      },

      /// Right
      (data) {
        return PictureMapper().fromMapListToModelList(data).fold(
          /// Left
          (dataException) async {
            final deleteResult = await localStorage.delete(itemKey);
            return deleteResult.fold(
              /// Left
              (dataException) {
                return Left(DomainException(dataException.error.domainError));
              },

              /// Right
              (_) {
                return Left(DomainException(dataException.error.domainError));
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
