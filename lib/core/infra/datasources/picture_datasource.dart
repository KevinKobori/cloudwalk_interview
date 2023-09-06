import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureDatasource implements IPictureDatasource {
  final IHttpClient httpClient;

  PictureDatasource(this.httpClient);

  @override
  Future<Result<List<ApodObjectModel>, DataException>>
      fetchLastTenDaysData(String url) async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);

    return resultHttpClient.when(
      (data) {
        try {
          return Success(List<ApodObjectModel>.from((data as List<dynamic>)
              .map((dynamic map) => map as ApodObjectModel)).toList());
        } catch (_) {
          return Error(DataException(DataErrorType.invalidData));
        }
      },
      (infraException) =>
          Error(DataException(infraException.errorType.dataError)),
    );
  }

  @override
  Future<ApodObjectModel> fetchByDate(String url) async { // TODO: Repository and Usecase Layers
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.when(
      (data) {
        try {
          // TODO: NOW
          return PicturesMapper().fromMapToModel((data as dynamic)).whenSuccess((success) => success)!;
        } catch (_) {
          throw DomainException(
              DataErrorType.invalidData.domainError);
        }
      },
      (infraException) => throw DomainException(
          infraException.errorType.dataError.domainError),
    );
  }
}
