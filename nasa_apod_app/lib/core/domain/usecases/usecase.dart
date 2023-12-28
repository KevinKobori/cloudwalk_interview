import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin UseCase<OutPut, Input> {
  Future<Either<DomainFailure, OutPut>> call(Input params);
}
