import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalLoadLastTenDaysPicturesByDateUseCaseImpl
    implements LocalLoadLastTenDaysPicturesByDateUseCase {
  final ILocalStorage localStorage;
  final String itemKey;

  LocalLoadLastTenDaysPicturesByDateUseCaseImpl({
    required this.itemKey,
    required this.localStorage,
  });

  @override
  Future<Either<DomainException, List<PictureEntity>>> call(void _) async {
    try {
      final dataResult = await localStorage.fetch(itemKey);
      return dataResult.fold(
        /// Left
        (dataException) {
          return Left(DomainException(dataException.error.domainError));
        },

        /// Right
        (localData) {
          if (localData.isEmpty != false) {
            return Left(DomainException(DomainErrorType.unexpected));
          }
          return PictureMapper().fromMapListToEntityList(localData);
        },
      );
    } catch (_) {
      return Left(DomainException(DomainErrorType.unexpected));
    }
  }
}
