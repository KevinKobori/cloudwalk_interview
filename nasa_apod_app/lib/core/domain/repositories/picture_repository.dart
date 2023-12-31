import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin PictureRepository {
  Future<Either<DomainFailure, List<PictureEntity>>> getLastTenDaysData(
      String url);
}
