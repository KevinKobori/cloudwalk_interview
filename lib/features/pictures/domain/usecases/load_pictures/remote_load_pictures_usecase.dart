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
  Future<Result<List<PictureEntity>, DomainException>> loadLastTenDaysData() async {
    final resultHttpClient = await httpClient.request(method: 'get', url: url);
    
    // Infra/Datasource
    final Result<dynamic, InfraException> resultDataSource = resultHttpClient.when(
      (body) {
        if(PicturesMapper().bodyIsAListOfMap(body)) {
          return Success(body);
        } else {
          return Error(InfraException(InfraErrorType.invalidData));
        }
      }, 
      (externalException) => Error(InfraException(externalException.errorType.infraError)),
    );

    // Data/Repository
    final Result<List<PictureModel>, DataException> resultRepository = resultDataSource.when(
      (mapList) {
        final resultModel = PicturesMapper().fromMapListToModelList(mapList);
        return resultModel.when(
          (pictureModelList) => Success(pictureModelList), 
          (infraException) => Error(DataException(infraException.errorType.dataError)),
        );
      },
      (infraException) => Error(DataException(infraException.errorType.dataError)),
    );
      
    // Domain/UseCase
    final Result<List<PictureEntity>, DomainException> resultUseCase = resultRepository.when(
      (pictureModelList) {
        final resultEntity = PicturesMapper().fromModelListToEntityList(pictureModelList);
        return resultEntity.when(
          (pictureEntityList) => Success(pictureEntityList), 
          (infraException) => Error(DomainException(infraException.errorType.dataError.domainError)),
        );
      },
      (dataException) => Error(DomainException(dataException.errorType.domainError)),
    );

    return resultUseCase;
  }
}