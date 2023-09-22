import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureRepository implements IPictureRepository {
  final IPictureDatasource pictureDatasource;

  PictureRepository(this.pictureDatasource);

  @override
  Future<Either<DomainException, List<PictureEntity>>> getLastTenDaysData(
      String url) async {
    final resultDataSource = await pictureDatasource.fetchLastTenDaysData(url);

    return resultDataSource.fold(
      /// Left
      (dataException) {
        return Left(DomainException(dataException.errorType.domainError));
      },
      (pictureModelList) {
        return PictureMapper().fromModelListToEntityList(pictureModelList);
      },
    );
  }
}
