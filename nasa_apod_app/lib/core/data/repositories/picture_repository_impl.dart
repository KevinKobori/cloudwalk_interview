import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureDatasource pictureDatasource;

  PictureRepositoryImpl(this.pictureDatasource);

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> getLastTenDaysData(
      String url) async {
    final resultDataSource = await pictureDatasource.fetchLastTenDaysData(url);

    return resultDataSource.fold(
      /// Left
      (dataFailure) {
        return Left(DomainFailure(dataFailure.error));
      },

      /// Right
      (pictureModelList) {
        return PictureMapper().fromModelListToEntityList(pictureModelList);
      },
    );
  }
}
