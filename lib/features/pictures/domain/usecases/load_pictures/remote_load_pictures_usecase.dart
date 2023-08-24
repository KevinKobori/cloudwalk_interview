import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class RemoteLoadPicturesUseCase implements IRemoteLoadPicturesUseCase {
  final IPictureRepository picturesRepository;
  final String url;

  RemoteLoadPicturesUseCase({
    required this.picturesRepository,
    required this.url,
  });

  /// Example illustrating the use of the "package:multiple_result" library.
  @override
  Future<Result<List<PictureEntity>, DomainException>>
      loadLastTenDaysData() async {
    final resultRepository = await picturesRepository.getLastTenDaysData(url);

    return resultRepository.when( // TODO: NOW
      (pictureModelList) {
        final resultEntity =
            PicturesMapper().fromModelListToEntityList(pictureModelList);
        return resultEntity.when(
          (pictureEntityList) => Success(pictureEntityList),
          (infraException) => Error(
              DomainException(infraException.errorType.dataError.domainError)),
        );
      },
      (dataException) =>
          Error(DomainException(dataException.errorType.domainError)),
    );
  }
}
