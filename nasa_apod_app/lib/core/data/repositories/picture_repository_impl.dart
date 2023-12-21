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
        (domainFailure) {
          return Left(domainFailure);
        },

        /// Right
        (pictureModelList) {
          final entityListResult =
              PictureMapper().fromModelListToEntityList(pictureModelList);
          return entityListResult.fold(
            /// Left
            (mapperFailure) {
              return Left(mapperFailure.toDomainFailure);
            },

            /// Right
            (entityList) {
              return Right(entityList);
            },
          );
        },
      );
    } else {
      return const Left(DomainFailure.notHaveInternetConnection);
    }
  }
}
