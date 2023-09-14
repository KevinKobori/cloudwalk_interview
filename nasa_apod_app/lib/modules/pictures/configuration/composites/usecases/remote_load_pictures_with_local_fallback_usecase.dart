import 'package:nasa_apod_app/nasa_apod_app.dart';

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

      final List<PictureEntity> pictureEntityList = result.fold(
        (domainException) => throw domainException, // TODO: NOW
        (pictureEntityList) => pictureEntityList,
      );

      await localUseCase.saveLastTenDaysData(pictureEntityList);
      return pictureEntityList;
    } catch (error) {
      await localUseCase.validateLastTenDaysData();
      return await localUseCase.loadLastTenDaysData();
    }
  }
}
