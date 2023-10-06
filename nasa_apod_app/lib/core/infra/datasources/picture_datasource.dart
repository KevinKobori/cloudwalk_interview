import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureDatasource implements IPictureDatasource {
  final IHttpClient httpClient;

  PictureDatasource(this.httpClient);

  @override
  Future<Either<DataException, List<PictureModel>>> fetchLastTenDaysData(
      String url) async {
    final requestResult = await httpClient.request(method: 'get', url: url);

    return await requestResult.fold(
      /// Left
      (serverException) {
        return Left(serverException);
      },

      /// Right
      (data) {
        final dynamicListResult = JsonMapper.tryDecode(data);
        return dynamicListResult.fold(
          /// Left
          (mapperException) {
            return Left(mapperException);
          },

          /// Right
          (dynamicList) {
            final mapListResult =
                JsonMapper.fromDynamicListToMapList(dynamicList);
            return mapListResult.fold(
              /// Left
              (mapperException) {
                return Left(mapperException);
              },

              /// Right
              (mapList) {
                return PictureMapper().fromMapListToModelList(mapList);
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<Either<DomainException, PictureModel>> fetchByDate(String url) async {
    // TODO: Repository and Usecase Layers
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.fold(
      /// Left
      (serverException) {
        return Left(DomainException(serverException.error.domainError));
      },
      (data) {
        try {
          final pictureMapResult = JsonMapper.tryDecode(data);
          return pictureMapResult.fold(
            (mapperException) {
              return Left(DomainException(mapperException.error.domainError));
            },
            (pictureMap) {
              return PictureMapper()
                  .fromMapToModel((pictureMap as Map<String, dynamic>));
            },
          );
        } catch (_) {
          return Left(DomainException(DataErrorType.invalidData.domainError));
        }
      },
    );
  }
}
