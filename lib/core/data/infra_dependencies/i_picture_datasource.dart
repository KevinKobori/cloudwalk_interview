import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

mixin IPictureDatasource {
  Future<Result<List<Map<String, String>>, InfraException>>
      fetchLastTenDaysData(String url);
}
