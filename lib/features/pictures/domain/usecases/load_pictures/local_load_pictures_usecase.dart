import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class LocalLoadPicturesUseCase implements ILoadPicturesUseCase {
  final ILocalStorage localStorage;

  LocalLoadPicturesUseCase({required this.localStorage});

  final String itemKey = 'apod_objects';

  /// Example showcasing the implementation without using
  /// "package:multiple_result" and without adding intermediary
  /// treatments between the layers: Domain, Data, Infrastructure,
  /// and External.
  @override
  Future<List<PictureEntity>> loadLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      if (data?.isEmpty != false) {
        throw DomainException(DomainErrorType.unexpected);
      }

      return await _getEntityList(data);
    } catch (_) {
      throw DomainException(DomainErrorType.unexpected);
    }
  }

  Future<void> validateLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      await _getEntityList(data);
    } catch (_) {
      await localStorage.delete(itemKey);
    }
  }

  Future<List<PictureEntity>> _getEntityList(dynamic data) async {
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
  }
}
