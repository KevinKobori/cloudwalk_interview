import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin LocalSavePicturesUseCase implements UseCase<void, List<PictureEntity>> {
  @override
  Future<Either<DomainFailure, void>> call(
      List<PictureEntity> pictureEntityList);
}
