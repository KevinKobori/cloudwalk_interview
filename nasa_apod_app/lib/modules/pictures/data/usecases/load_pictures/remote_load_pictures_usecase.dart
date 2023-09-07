import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:multiple_result/multiple_result.dart';

class RemoteLoadPicturesUseCase implements IRemoteLoadPicturesUseCase {
  final IPictureRepository picturesRepository;
  final String url;

  RemoteLoadPicturesUseCase({
    required this.picturesRepository,
    required this.url,
  });

  /// Example illustrating the use of the "package:multiple_result" library.
  @override
  Future<Result<List<PictureEntity>, DomainException>>
      loadLastTenDaysData() async =>
          await picturesRepository.getLastTenDaysData(url);
}
