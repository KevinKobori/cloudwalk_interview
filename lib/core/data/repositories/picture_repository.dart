import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PicturesRepository implements IPicturesRepository {
  final IHttpClient httpClient;

  PicturesRepository({required this.httpClient});

  @override
  Future<Result<List<PictureModel>, DataException>> fetchLastTenDaysData(
      String url) async {
    // Infra/Datasource
    final resultHttpClient = await httpClient.request(method: 'get', url: url);

    final Result<dynamic, InfraException> resultDataSource =
        resultHttpClient.when(
      (body) {
        if (PicturesMapper().bodyIsAListOfMap(body)) {
          return Success(body);
        } else {
          return Error(InfraException(InfraErrorType.invalidData));
        }
      },
      (externalException) =>
          Error(InfraException(externalException.errorType.infraError)),
    );

    // Data/Repository
    return resultDataSource.when(
      (mapList) {
        final resultModel = PicturesMapper().fromMapListToModelList(mapList);
        return resultModel.when(
          (pictureModelList) {
            return Success(pictureModelList);
          },
          (infraException) {
            return Error(DataException(infraException.errorType.dataError));
          },
        );
      },
      (infraException) =>
          Error(DataException(infraException.errorType.dataError)),
    );
  }
}
