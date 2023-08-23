import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureDatasource implements IPictureDatasource {
  final IHttpClient httpClient;

  PictureDatasource(this.httpClient);

  @override
  Future<Result<List<Map<String, String>>, InfraException>>
      fetchLastTenDaysData(String url) async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);

    return resultHttpClient.when(
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
  }
}
