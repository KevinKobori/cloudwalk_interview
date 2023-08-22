import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class RemoteLoadPicturesUsecase implements ILoadPicturesUseCase {
  final IHttpClient httpClient;
  final String url;

  RemoteLoadPicturesUsecase({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<Result<List<PictureEntity>, DomainException>> call() async {
    final result = await httpClient.request(method: 'get', url: url);

    return result.when(
      (success) => const Success([]),
      (error) => Error(DomainException(error.errorType.infraError.dataError.domainError)),
    );
  }
}