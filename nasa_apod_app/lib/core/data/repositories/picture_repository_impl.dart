import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureDatasource pictureDatasource;
  final NetworkInfo networkInfo;

  PictureRepositoryImpl({
    required this.pictureDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> getLastTenDaysData(
      String url) async {
    if (await networkInfo.isConnected) {
      final resultDataSource =
          await pictureDatasource.fetchLastTenDaysData(url);

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
    } else {
      return Left(DomainFailure(DomainFailureType.notHaveInternetConnection));
    }
  }
}
