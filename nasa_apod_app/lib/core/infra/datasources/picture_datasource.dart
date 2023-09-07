import 'package:multiple_result/multiple_result.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureDatasource implements IPictureDatasource {
  final IHttpClient httpClient;

  PictureDatasource(this.httpClient);

  @override
  Future<Result<List<PictureModel>, DataException>> fetchLastTenDaysData(
      String url) async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);

    return await resultHttpClient.when(
      (data) {
        // try {
        //   // Json.tryDecode(response.body)
        //   final mapList = Json.tryDecode(data);

        //   final List<PictureModel> mapListTypped = List<PictureModel>.from(
        //       (mapList as List<dynamic>).map((dynamic map) {
        //     return PictureMapper()
        //         .fromMapToModel(map)
        //         .whenSuccess((success) => success
        //             // map as Map<String, dynamic>,
        //             );
        //   })).toList();
        //   return Success(mapListTypped);
        try {
          final mapList = Json.tryDecode(data);

          final List<PictureModel> modelList = List<PictureModel>.from(
              (mapList as List<Map<String, dynamic>>)
                  .map((Map<String, dynamic> map) {
                    final res = PictureMapper()
                .fromMapToModel(map)
                .whenSuccess((success) => success
                    // map as Map<String, dynamic>,
                    );
            return res;
          })).toList();
          return Success(modelList);

          // return

          // PictureMapper()
          //     .fromMapToModel((data as dynamic))
          //     .whenSuccess((success) =>
          //     Success(

          //     )

          //     )!;
        } catch (_) {
          return Error(DataException(DataErrorType.invalidData));
        }
      },
      (externalException) =>
          Error(DataException(externalException.errorType.dataError)),
    );

    // return resultHttpClient.when(
    //   (mapList) => PictureMapper()
    //       .fromMapListToModelList(mapList as List<Map<String, dynamic>>)
    //       .when((success) => Success(success), (error) => Error(error)),
    //   (infraException) =>
    //       Error(DataException(infraException.errorType.dataError)),
    // );
    // //  resultHttpClient.when(
    // //   (data) {
    // //     try {
    // //       return

    // //       // List<PictureModel>.from((data as List<dynamic>).map().toList();
    // //       PictureMapper()
    // //           .fromMapListToModelList(data
    // //               //   List<PictureModel>.from((data as List<dynamic>).map(
    // //               //   (dynamic mapList) =>

    // //               //       // map as PictureModel
    // //               //       PictureMapper().fromMapListToModelList(
    // //               //           mapList as List<Map<String, dynamic>>),
    // //               // )).toList()
    // //               )
    // //           .when((success) => Success(success), (error) => Error(error));
    // //     } catch (_) {
    // //       return Error(DataException(DataErrorType.invalidData));
    // //     }
    // //   },
    // //   (infraException) =>
    // //       Error(DataException(infraException.errorType.dataError)),
    // // );
  }

  @override
  Future<PictureModel> fetchByDate(String url) async {
    // TODO: Repository and Usecase Layers
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.when(
      (data) {
        try {
          // TODO: NOW
          return PictureMapper()
              .fromMapToModel((data as dynamic))
              .whenSuccess((success) => success)!;
        } catch (_) {
          throw DomainException(DataErrorType.invalidData.domainError);
        }
      },
      (infraException) =>
          throw DomainException(infraException.errorType.dataError.domainError),
    );
  }
}
