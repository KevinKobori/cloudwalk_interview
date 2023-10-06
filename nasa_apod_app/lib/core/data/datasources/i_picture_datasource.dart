import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin IPictureDatasource {
  Future<Either<DataFailure, List<PictureModel>>> fetchLastTenDaysData(
      String url);

  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url);
}
