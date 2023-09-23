import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin ILocalLoadPicturesUseCase implements ILoadPicturesUseCase {
  @override
  Future<Either<DomainException, List<PictureEntity>>> loadLastTenDaysData();
  Future<Either<DomainException, void>> validateLastTenDaysData();
  Future<Either<DomainException, void>> saveLastTenDaysData(
      List<PictureEntity> pictureEntityList);
}
