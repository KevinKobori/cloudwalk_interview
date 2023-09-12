import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:multiple_result/multiple_result.dart';

mixin IPictureRepository {
  Future<Result<List<PictureEntity>, DomainException>> getLastTenDaysData(
      String url);
}
