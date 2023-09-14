import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin IPictureDatasource {
  Future<Either<DataException, List<PictureModel>>> fetchLastTenDaysData(
      String url);

  Future<PictureModel?> fetchByDate(String url);
}
