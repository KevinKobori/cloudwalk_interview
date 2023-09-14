import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin IRemoteLoadPicturesUseCase implements ILoadPicturesUseCase {
  @override
  Future<Either<DomainException, List<PictureEntity>>> loadLastTenDaysData();
}
