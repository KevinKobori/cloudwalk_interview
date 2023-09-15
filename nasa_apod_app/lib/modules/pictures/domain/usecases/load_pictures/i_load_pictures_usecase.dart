import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin ILoadPicturesUseCase {
  Future<Either<DomainException, List<PictureEntity>>> loadLastTenDaysData();
}
