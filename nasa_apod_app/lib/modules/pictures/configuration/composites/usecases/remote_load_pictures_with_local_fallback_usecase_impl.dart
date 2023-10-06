import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class RemoteLoadPicturesWithLocalFallbackUseCaseImpl
    implements LoadLastTenDaysPicturesByDateUseCase {
  final RemoteLoadLastTenDaysPicturesByDateUseCase
      remoteLoadLastTenDaysPicturesByDate;
  final LocalLoadLastTenDaysPicturesByDateUseCase
      localLoadLastTenDaysPicturesByDate;
  final LocalValidatePicturesUseCase localValidatePictures;
  final LocalSavePicturesUseCase localSavePictures;

  RemoteLoadPicturesWithLocalFallbackUseCaseImpl({
    required this.remoteLoadLastTenDaysPicturesByDate,
    required this.localLoadLastTenDaysPicturesByDate,
    required this.localValidatePictures,
    required this.localSavePictures,
  });

  @override
  Future<Either<DomainException, List<PictureEntity>>> call(void _) async {
    final result = await remoteLoadLastTenDaysPicturesByDate.call(null);

    return await result.fold(
      (domainException) async {
        await localValidatePictures.call(null);
        return await localLoadLastTenDaysPicturesByDate.call(null);
      },
      (pictureEntityList) async {
        await localSavePictures.call(pictureEntityList);
        return Right(pictureEntityList);
      },
    );
  }
}
