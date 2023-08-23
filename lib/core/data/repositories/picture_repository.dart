import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureRepository implements IPictureRepository {
  final PictureDatasource pictureDatasource;

  PictureRepository(this.pictureDatasource);

  @override
  Future<Result<List<PictureModel>, DataException>> getLastTenDaysData(
      String url) async {
    final resultDataSource = await pictureDatasource.fetchLastTenDaysData(url);

    return resultDataSource.when(
      (mapList) {
        final resultModel = PicturesMapper().fromMapListToModelList(mapList);
        return resultModel.when(
          (pictureModelList) {
            return Success(pictureModelList);
          },
          (infraException) {
            return Error(DataException(infraException.errorType.dataError));
          },
        );
      },
      (infraException) =>
          Error(DataException(infraException.errorType.dataError)),
    );
  }
}
