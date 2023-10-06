import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin PictureDatasource {
  Future<Either<DataFailure, List<PictureModel>>> fetchLastTenDaysData(
      String url);

  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url);
}

class PictureDatasourceImpl implements PictureDatasource {
  final HttpClient httpClient;

  PictureDatasourceImpl(this.httpClient);

  @override
  Future<Either<DataFailure, List<PictureModel>>> fetchLastTenDaysData(
      String url) async {
    final requestResult = await httpClient.request(method: 'get', url: url);

    return await requestResult.fold(
      /// Left
      (serverFailure) {
        return Left(serverFailure);
      },

      /// Right
      (data) {
        final dynamicListResult = JsonMapper.tryDecode(data);
        return dynamicListResult.fold(
          /// Left
          (mapperFailure) {
            return Left(mapperFailure);
          },

          /// Right
          (dynamicList) {
            final mapListResult =
                JsonMapper.fromDynamicListToMapList(dynamicList);
            return mapListResult.fold(
              /// Left
              (mapperFailure) {
                return Left(mapperFailure);
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
  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url) async {
    // TODO: Repository and Usecase Layers
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.fold(
      /// Left
      (serverFailure) {
        return Left(DomainFailure(serverFailure.error));
      },
      (data) {
        try {
          final pictureMapResult = JsonMapper.tryDecode(data);
          return pictureMapResult.fold(
            (mapperFailure) {
              return Left(DomainFailure(mapperFailure.error));
            },
            (pictureMap) {
              return PictureMapper()
                  .fromMapToModel((pictureMap as Map<String, dynamic>));
            },
          );
        } catch (_) {
          return Left(DomainFailure(DataFailureType.invalidData.domainFailure));
        }
      },
    );
  }
}
