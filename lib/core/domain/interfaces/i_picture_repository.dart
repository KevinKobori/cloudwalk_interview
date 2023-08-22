import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

mixin IPicturesRepository {
  Future<Result<List<PictureModel>, DataException>> fetchLastTenDaysData(
      String url);
}
