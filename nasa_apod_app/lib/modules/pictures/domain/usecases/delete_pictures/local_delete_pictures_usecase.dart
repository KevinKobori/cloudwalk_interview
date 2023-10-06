import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin LocalDeletePicturesUseCase implements UseCase<void, List<PictureEntity>> {
  @override
  Future<Either<DomainException, void>> call(
      List<PictureEntity> pictureEntityList);
}
