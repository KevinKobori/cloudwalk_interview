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
    
    // Infra / Datasource
    final Result<dynamic, InfraException> resultDataSource = result.when(
      (body) {
        if(PictureMapper().bodyIsAListOfMap(body) || PictureMapper().bodyIsAMap(body)) {
          return Success(body);
        } else {
          return Error(InfraException(InfraErrorType.invalidData));
        }
      }, 
      (error) => Error(InfraException(error.errorType.infraError)),
    );

    // Data / Repository
    final Result<List<PictureModel>, DataException> resultRepository = resultDataSource.when(
      (mapList) {
        if(PictureMapper().bodyIsAListOfMap(mapList)) {
          return Success(List<PictureModel>.from((mapList as List<Map<String, String>>)
                .map((data) => 
                  PictureMapper().fromMapToModel(data).when(
                    (model) => model,
                    (error) => error,
                  ),
                )).toList());
        } else {
          return Error(DataException(DataErrorType.invalidData));
        }
      },
      (error) => Error(DataException(error.errorType.dataError)),
    );

      
    // Domain / UseCase
    final Result<List<PictureEntity>, DomainException> resultUseCase = resultRepository.when(
      (picturesModelList) {
         return Success(List<PictureEntity>.from(picturesModelList
                .map((data) => 
                  PictureMapper().fromModelToEntity(data).when(
                    (model) => model,
                    (error) => error,
                  ),
                )).toList());
      },
      (error) => Error(DomainException(error.errorType.domainError)),
    );

    return resultUseCase;
  }
}