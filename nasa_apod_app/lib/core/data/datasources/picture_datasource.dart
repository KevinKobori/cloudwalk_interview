import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin PictureDatasource {
  Future<Either<DomainFailure, List<PictureModel>>> fetchLastTenDaysData(
      String url);

  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url);
}