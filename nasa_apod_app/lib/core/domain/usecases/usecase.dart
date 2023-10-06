import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

// import '../../errors/failures.dart';

mixin UseCase<ReturnValue, Params> {
  Future<Either<DomainException, ReturnValue>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
