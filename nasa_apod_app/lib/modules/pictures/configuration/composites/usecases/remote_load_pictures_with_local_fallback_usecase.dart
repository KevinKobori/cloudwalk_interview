import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class RemoteLoadPicturesWithLocalFallbackUseCase
    implements ILoadPicturesUseCase {
  final IRemoteLoadPicturesUseCase remoteUseCase;
  final ILocalLoadPicturesUseCase localUseCase;

  RemoteLoadPicturesWithLocalFallbackUseCase({
    required this.remoteUseCase,
    required this.localUseCase,
  });

  @override
  Future<Either<DomainException, List<PictureEntity>>>
      loadLastTenDaysData() async {
    final result = await remoteUseCase.loadLastTenDaysData();

    return await result.fold(
      (domainException) async {
        await localUseCase.validateLastTenDaysData();
        return await localUseCase.loadLastTenDaysData();
      },
      (pictureEntityList) async {
        await localUseCase.saveLastTenDaysData(pictureEntityList);
        return Right(pictureEntityList);
      },
    );
  }
}
