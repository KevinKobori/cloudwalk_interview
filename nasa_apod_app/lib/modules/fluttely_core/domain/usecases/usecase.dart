import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin UseCase<Output, Input> {
  Future<Either<DomainFailure, Output>> call(Input params);
}
