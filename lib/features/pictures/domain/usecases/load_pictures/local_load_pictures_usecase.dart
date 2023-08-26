import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class LocalLoadPicturesUseCase implements ILocalLoadPicturesUseCase {
  final ILocalStorage localStorage;

  LocalLoadPicturesUseCase({required this.localStorage});

  String itemKey = 'apod_objects';

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

  @override
  Future<void> validateLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      await _getEntityList(data);
    } catch (_) {
      await localStorage.delete(itemKey);
    }
  }

  @override
  Future<void> saveLastTenDaysData(
      List<PictureEntity> pictureEntityList) async {
    try {
      final mapList = await _getMapList(pictureEntityList);
      await localStorage.save(key: itemKey, value: mapList);
    } catch (error) {
      throw DomainException(DomainErrorType.unexpected);
    }
  }

  Future<List<PictureEntity>> _getEntityList(dynamic data) async {
    return await PicturesMapper().fromMapListToModelList(data).when(
          (pictureModelList) async => await PicturesMapper()
              .fromModelListToEntityList(pictureModelList)
              .when(
                (pictureEntityList) => pictureEntityList,
                (domainException) => throw domainException,
              ),
          (dataException) =>
              throw DomainException(dataException.errorType.domainError),
        );
  }

  Future<List<Map<String, dynamic>>> _getMapList(
      List<PictureEntity> pictureEntityList) async {
    return await PicturesMapper()
        .fromEntityListToModelList(pictureEntityList)
        .when(
          (pictureModelList) async => await PicturesMapper()
              .fromModelListToMapList(pictureModelList)
              .when(
                (map) => map,
                (infraException) => throw DomainException(
                    infraException.errorType.dataError.domainError),
              ),
          (infraException) => throw DomainException(
              infraException.errorType.dataError.domainError),
        );
  }
}
