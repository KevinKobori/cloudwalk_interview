import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin LoadLastTenDaysPicturesByDateUseCase
    implements UseCase<List<PictureEntity>, void> {
  @override
  Future<Either<DomainException, List<PictureEntity>>> call(void _);
}
