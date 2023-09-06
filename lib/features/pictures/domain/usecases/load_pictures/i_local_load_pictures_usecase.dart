import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

mixin ILocalLoadPicturesUseCase implements ILoadPicturesUseCase {
  @override
  Future<List<ApodObjectEntity>> loadLastTenDaysData();
  Future<void> validateLastTenDaysData();
  Future<void> saveLastTenDaysData(List<ApodObjectEntity> pictureEntityList);
}