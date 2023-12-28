import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesCubit extends Cubit<PicturesState> implements PicturesPresenter {
  final RemoteLoadLastTenDaysPicturesByDateUseCase loadLastTenDaysPicturesByDate;

  PicturesCubit({
    required this.loadLastTenDaysPicturesByDate,
  }) : super(PicturesIdle());

  @override
  void loadPictures() async {
    emit(PicturesLoading());

    final loadpicturesResult = await _loadPictures();
    loadpicturesResult.fold(
      (domainFailure) => emit(PicturesError(domainFailure.toUIFailure)),
      (pictureViewModelList) => emit(PicturesLoaded(pictureViewModelList)),
    );
  }

  Future<Either<DomainFailure, List<PictureViewModel>>> _loadPictures() async {
    final nowDate = DateTime.now();
    final result = await loadLastTenDaysPicturesByDate.call(nowDate);

    return result.fold(
      (domainFailure) => Left(domainFailure),
      (pictureEntityList) {
        final pictureViewModelListResult =
            PictureMapper.fromEntityListToViewModelList(pictureEntityList);
        return pictureViewModelListResult.fold(
          (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),
          (pictureViewModelList) =>
              Right(pictureViewModelList.toList().reversed.toList()),
        );
      },
    );
  }

  @override
  void loadPictureByDate(ApodDate date) async {
    emit(PicturesLoading());

    final loadPictureByDateResult = await _loadPictureByDate(date);
    loadPictureByDateResult.fold(
      (domainFailure) => emit(PicturesError(domainFailure.toUIFailure)),
      (pictureViewModelList) => emit(PicturesLoaded(pictureViewModelList)),
    );
  }

  Future<Either<DomainFailure, List<PictureViewModel>>> _loadPictureByDate(
      ApodDate date) async {
    final datasource = PictureDatasourceImpl(httpClientAdapterFactory());

    final result = await datasource.fetchByDate(apodApiUrlFactory(
        apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
        requestPath: '&date=${date.value}'));

    return result.fold(
      (domainFailure) => Left(domainFailure),
      (pictureModel) {
        final pictureViewModelResult =
            PictureMapper.fromModelToViewModel(pictureModel);
        return pictureViewModelResult.fold(
          (mapperFailure) => Left(mapperFailure.fromJsonperToDomain),
          (pictureViewModel) => Right([pictureViewModel]),
        );
      },
    );
  }

  @override
  void pushToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel}) async {
    await Modular.to.pushNamed('/$pictureDate', arguments: pictureViewModel);
  }
}
