import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class RemoteLoadPicturesWithLocalFallbackUseCase
    implements ILoadPicturesUseCase {
  final IRemoteLoadPicturesUseCase remoteUseCase;
  final ILocalLoadPicturesUseCase localUseCase;

  RemoteLoadPicturesWithLocalFallbackUseCase({
    required this.remoteUseCase,
    required this.localUseCase,
  });

  /// Example showcasing the implementation without using
  /// "package:multiple_result"
  @override
  Future<List<PictureEntity>> loadLastTenDaysData() async {
    try {
      final result = await remoteUseCase.loadLastTenDaysData();

      final List<PictureEntity> pictureEntityList = result.when(
        (pictureEntityList) => pictureEntityList,
        (domainException) => throw domainException,
      );

      await localUseCase.saveLastTenDaysData(pictureEntityList);
      // return pictureEntityList;
      await localUseCase.validateLastTenDaysData();
      return await localUseCase.loadLastTenDaysData();
    } catch (_) {
      await localUseCase.validateLastTenDaysData();
      return await localUseCase.loadLastTenDaysData();
    }
  }
}
