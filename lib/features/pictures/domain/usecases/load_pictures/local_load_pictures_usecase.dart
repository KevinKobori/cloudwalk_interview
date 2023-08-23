import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class LocalLoadPicturesUsecase implements ILoadPicturesUseCase {
  @override
  Future<Result<List<PictureEntity>, DomainException>>
      loadLastTenDaysData() async {
    return Error(DomainException(DomainErrorType.unexpected));
  }
}
