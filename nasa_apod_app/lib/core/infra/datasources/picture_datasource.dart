import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureDatasource implements IPictureDatasource {
  final IHttpClient httpClient;

  PictureDatasource(this.httpClient);

  @override
  Future<Either<DataException, List<PictureModel>>> fetchLastTenDaysData(
      String url) async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);

    return await resultHttpClient.fold(
      (infraException) {
        return Left(DataException(infraException.errorType.dataError));
      },
      (data) {
        try {
          final dynamicList = JsonMapper.tryDecode(data);

          final List<Map<String, dynamic>> mapList =
              JsonMapper.fromDynamicListToMapList(dynamicList);

          // late final List<PictureModel> modelList;

          return PictureMapper().fromMapListToModelList(mapList);
          // .fold(
          //       (dataException) => Left(dataException),
          //       (modelList) => Right(modelList),
          //     );

          // List<PictureModel>.from(
          //     (mapList).map((Map<String, dynamic> map) {
          //   return PictureMapper().fromMapToModel(map).fold((l) => l, (r) => r);
          // })).toList();
          // return Right(modelList);
        } catch (_) {
          return Left(DataException(DataErrorType.invalidData));
        }
      },
    );
  }

  @override
  Future<PictureModel?> fetchByDate(String url) async {
    // TODO: Repository and Usecase Layers
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.fold(
      (infraException) {
        throw DomainException(infraException.errorType.dataError.domainError);
      },
      (data) {
        try {
          // TODO: NOW
          final map = JsonMapper.tryDecode(data);

          return PictureMapper()
              .fromMapToModel((map as Map<String, dynamic>))
              .foldRight(null, (r, previous) => r);
        } catch (_) {
          throw DomainException(DataErrorType.invalidData.domainError);
        }
      },
    );
  }
}
