import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPageCubit extends Cubit<PicturesPageState>
    implements PicturesPagePresenter {
  final RemoteLoadLastTenDaysPicturesByDateUseCase
      loadLastTenDaysPicturesByDate;

  PicturesPageCubit({
    required this.loadLastTenDaysPicturesByDate,
  }) : super(PicturesPageStateLoading());

  @override
  void loadPictures() async {
    emit(PicturesPageStateLoading());

    final loadpicturesResult = await _loadPictures();
    loadpicturesResult.fold(
      (domainFailure) =>
          emit(PicturesPageStateLoadFailure(domainFailure.toUIFailure)),
      (pictureViewModelList) =>
          emit(PicturesPageStateLoadSuccess(pictureViewModelList)),
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
  void loadPictureByDate(DateTime date) async {
    emit(PicturesPageStateLoading());

    final loadPictureByDateResult = await _loadPictureByDate(date);
    loadPictureByDateResult.fold(
      (domainFailure) =>
          emit(PicturesPageStateLoadFailure(domainFailure.toUIFailure)),
      (pictureViewModelList) =>
          emit(PicturesPageStateLoadSuccess(pictureViewModelList)),
    );
  }

  Future<Either<DomainFailure, List<PictureViewModel>>> _loadPictureByDate(
      DateTime date) async {
    final datasource = PictureDatasourceImpl(httpClientAdapterFactory());
    final apodDate = DateTimeMapper.getStringFromDateTimeYMD(date);
    final result = await datasource.fetchByDate(apodApiUrlFactory(
        apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
        requestPath: '&date=$apodDate'));
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
      {required PictureViewModel pictureViewModel}) {
    NavigatorManager.pushNamed('/$pictureDate', arguments: pictureViewModel);
  }
}
