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
      (infraException) async {
        final deleteResult = await localStorage.delete(itemKey);
        return deleteResult.fold(
          /// Left
          (infraException) {
            return Left(DomainException(
                infraException.errorType.dataError.domainError));
          },

          /// Right
          (_) {
            return Left(DomainException(
                infraException.errorType.dataError.domainError));
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
              (infraException) {
                return Left(DomainException(
                    infraException.errorType.dataError.domainError));
              },

              /// Right
              (_) {
                return Left(
                    DomainException(dataException.errorType.domainError));
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
