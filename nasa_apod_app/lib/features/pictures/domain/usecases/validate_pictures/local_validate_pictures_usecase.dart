import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin LocalValidatePicturesUseCase implements UseCase<void, void> {
  @override
  Future<Either<DomainFailure, void>> call(void _);
}
