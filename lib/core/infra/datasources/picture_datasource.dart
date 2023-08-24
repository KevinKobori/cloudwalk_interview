import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureDatasource implements IPictureDatasource {
  final IHttpClient httpClient;

  PictureDatasource(this.httpClient);

  @override
  Future<Result<List<Map<String, dynamic>>, InfraException>>
      fetchLastTenDaysData(String url) async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.when(
      (data) {
        final mapList = PicturesMapper().tryDecode(data);

        final List<Map<String, dynamic>> mapListTypped =
            List<Map<String, dynamic>>.from(
          (mapList as List<dynamic>).map(
            (dynamic map) => map as Map<String, dynamic>,
          ),
        ).toList();

        try {
          return Success(mapListTypped);
        } catch (_) {
          return Error(InfraException(InfraErrorType.invalidData));
        }
      },
      (externalException) =>
          Error(InfraException(externalException.errorType.infraError)),
    );
  }

  @override
  Future<Map<String, dynamic>> fetchByDate(String url) async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    return resultHttpClient.when(
      (data) {
        final map = PicturesMapper().tryDecode(data);

        final Map<String, dynamic> mapTypped =
            Map<String, dynamic>.from((map as dynamic));

        try {
          return mapTypped;
        } catch (_) {
          throw DomainException(
              InfraErrorType.invalidData.dataError.domainError);
        }
      },
      (externalException) => throw DomainException(
          externalException.errorType.infraError.dataError.domainError),
    );
  }
}
