import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    implements RemoteLoadLastTenDaysPicturesByDateUseCase {
  final IPictureRepository picturesRepository;
  final String url;

  RemoteLoadLastTenDaysPicturesByDateUseCaseImpl({
    required this.picturesRepository,
    required this.url,
  });

  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(void _) async {
    final result = await picturesRepository.getLastTenDaysData(url);
    return result;
  }
}
