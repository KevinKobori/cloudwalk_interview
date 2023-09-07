import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:multiple_result/multiple_result.dart';

mixin IPictureDatasource {
  Future<Result<List<PictureModel>, DataException>>
      fetchLastTenDaysData(String url);

  Future<PictureModel> fetchByDate(String url);
}
