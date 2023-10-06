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
  Future<Either<DomainFailure, List<PictureEntity>>> call(void _) async {
    try {
      final dataResult = await localStorage.fetch(itemKey);
      return dataResult.fold(
        /// Left
        (dataFailure) {
          return Left(DomainFailure(dataFailure.error.domainFailure));
        },

        /// Right
        (localData) {
          if (localData.isEmpty != false) {
            return Left(DomainFailure(DomainFailureType.unexpected));
          }
          return PictureMapper().fromMapListToEntityList(localData);
        },
      );
    } catch (_) {
      return Left(DomainFailure(DomainFailureType.unexpected));
    }
  }
}
