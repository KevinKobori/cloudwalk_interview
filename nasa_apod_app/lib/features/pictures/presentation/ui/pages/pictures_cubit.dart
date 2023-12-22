import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesCubit extends Cubit<PicturesState> {
  final LoadLastTenDaysPicturesByDateUseCase loadLastTenDaysPicturesByDate;

  PicturesCubit({
    required this.loadLastTenDaysPicturesByDate,
  }) : super(PicturesIdle());

  Future<void> fetchPictures() async {
    try {
      emit(PicturesLoading());

      final fetchResult = await fetchYourPictures();
      fetchResult.fold(
        (domainFailure) => emit(PicturesError(domainFailure.toUIFailure)),
        (pictureViewModelList) => emit(PicturesLoaded(pictureViewModelList)),
      );
    } catch (e) {
      emit(PicturesError(e.toString()));
    }
  }

  Future<Either<DomainFailure, List<PictureViewModel>>>
      fetchYourPictures() async {
    final nowDate = DateTime.now();
    final result = await loadLastTenDaysPicturesByDate.call(nowDate);

    return result.fold(
      (domainFailure) => Left(domainFailure),
      (pictureEntityList) {
        final viewModelResult =
            PictureMapper().fromEntityListToViewModelList(pictureEntityList);
        return viewModelResult.fold(
          (mapperFailure) => Left(mapperFailure.fromMapperToDomain),
          (pictureViewModelList) =>
              Right(pictureViewModelList.toList().reversed.toList()),
        );
      },
    );
  }
}
