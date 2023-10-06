import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class RemoteLoadLastTenDaysPicturesByDateWithLocalFallbackUseCaseImpl
    implements LoadLastTenDaysPicturesByDateUseCase {
  final RemoteLoadLastTenDaysPicturesByDateUseCase
      remoteLoadLastTenDaysPicturesByDate;
  final LocalLoadLastTenDaysPicturesByDateUseCase
      localLoadLastTenDaysPicturesByDate;
  final LocalValidatePicturesUseCase localValidatePictures;
  final LocalSavePicturesUseCase localSavePictures;

  RemoteLoadLastTenDaysPicturesByDateWithLocalFallbackUseCaseImpl({
    required this.remoteLoadLastTenDaysPicturesByDate,
    required this.localLoadLastTenDaysPicturesByDate,
    required this.localValidatePictures,
    required this.localSavePictures,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(DateTime date) async {
    final result = await remoteLoadLastTenDaysPicturesByDate.call(date);

    return await result.fold(
      (domainFailure) async {
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
