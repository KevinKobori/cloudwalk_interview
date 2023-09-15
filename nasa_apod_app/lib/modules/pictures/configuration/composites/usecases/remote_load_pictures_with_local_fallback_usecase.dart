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
    try {
      final result = await remoteUseCase.loadLastTenDaysData();

      return result.fold(
        (domainException) {
          return Left(domainException);
        },
        (pictureEntityList) async {
          await localUseCase.saveLastTenDaysData(pictureEntityList);
          return Right(pictureEntityList);
        },
      );
    } catch (error) {
      await localUseCase.validateLastTenDaysData();
      return await localUseCase.loadLastTenDaysData();
    }
  }
}
