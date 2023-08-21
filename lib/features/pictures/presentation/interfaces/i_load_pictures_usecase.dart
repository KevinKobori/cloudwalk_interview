import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

abstract class ILoadPicturesUseCase {
  Future<List<PictureEntity>> call();
}