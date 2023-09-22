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
      (infraException) {
        return Left(DataException(infraException.errorType.dataError));
      },

      /// Right
      (data) {
        final dynamicListResult = JsonMapper.tryDecode(data);
        return dynamicListResult.fold(
          /// Left
          (infraException) {
            return Left(DataException(infraException.errorType.dataError));
          },

          /// Right
          (dynamicList) {
            final mapListResult =
                JsonMapper.fromDynamicListToMapList(dynamicList);
            return mapListResult.fold(
              /// Left
              (infraException) {
                return Left(DataException(infraException.errorType.dataError));
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
      (infraException) {
        return Left(
            DomainException(infraException.errorType.dataError.domainError));
      },
      (data) {
        try {
          final map = JsonMapper.tryDecode(data);

          return PictureMapper().fromMapToModel((map as Map<String, dynamic>));
        } catch (_) {
          return Left(DomainException(DataErrorType.invalidData.domainError));
        }
      },
    );
  }
}
