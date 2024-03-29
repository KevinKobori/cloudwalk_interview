import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin RemoteLoadLastTenDaysPicturesByDateUseCase
    implements UseCase<DomainFailure, List<PictureEntity>, DateTime> {
  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(DateTime date);
}
