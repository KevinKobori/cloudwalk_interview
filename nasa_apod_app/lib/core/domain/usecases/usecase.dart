import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin UseCase<ReturnValue, Params> {
  Future<Either<DomainFailure, ReturnValue>> call(Params params);
}