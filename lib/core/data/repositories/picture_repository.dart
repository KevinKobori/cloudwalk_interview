import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class PictureRepository implements IPictureRepository {
  final IPictureDatasource pictureDatasource;

  PictureRepository(this.pictureDatasource);

  @override
  Future<Result<List<ApodObjectModel>, DataException>> getLastTenDaysData(
      String url) async {
    final resultDataSource = await pictureDatasource.fetchLastTenDaysData(url);

    return resultDataSource.when(
      (mapList) => PicturesMapper().fromMapListToModelList(mapList),
      (infraException) =>
          Error(DataException(infraException.errorType.dataError)),
    );
  }
}
