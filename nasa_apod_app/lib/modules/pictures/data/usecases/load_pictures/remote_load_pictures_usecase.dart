import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class RemoteLoadPicturesUseCase implements IRemoteLoadPicturesUseCase {
  final IPictureRepository picturesRepository;
  final String url;

  RemoteLoadPicturesUseCase({
    required this.picturesRepository,
    required this.url,
  });

  @override
  Future<Either<DomainException, List<PictureEntity>>>
      loadLastTenDaysData() async {
    final result = await picturesRepository.getLastTenDaysData(url);
    return result;
  }
}
