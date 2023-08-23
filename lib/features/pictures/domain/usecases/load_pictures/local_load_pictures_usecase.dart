import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class LocalLoadPicturesUseCase implements ILoadPicturesUseCase {
  final ILocalStorage localStorage;

  LocalLoadPicturesUseCase({required this.localStorage});

  /// Example showcasing the implementation without using
  /// "package:multiple_result" and without adding intermediary
  /// treatments between the layers: Domain, Data, Infrastructure,
  /// and External.
  @override
  Future<List<PictureEntity>> loadLastTenDaysData() async {
    try {
      final data = await localStorage.fetch('apod_objects');
      if (data?.isEmpty != false) {
        throw DomainException(DomainErrorType.unexpected);
      }

      return await PicturesMapper().fromMapListToModelList(data).when(
            (pictureModel) =>
                PicturesMapper().fromModelListToEntityList(pictureModel).when(
                      (pictureEntityList) => pictureEntityList,
                      (infraException) => throw DomainException(
                          infraException.errorType.dataError.domainError),
                    ),
            (infraException) => throw DomainException(
                infraException.errorType.dataError.domainError),
          );
    } catch (_) {
      throw DomainException(DomainErrorType.unexpected);
    }
  }
}
