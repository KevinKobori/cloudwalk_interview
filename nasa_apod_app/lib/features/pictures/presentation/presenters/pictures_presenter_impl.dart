import 'dart:async';

import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class PicturesPresenter {
  Stream<bool> get isLoadingStream;
  Stream<List<PictureViewModel>?> get picturesStream;
  Stream<NavigateToParams?> get navigateToStream;
  Future<void> loadPictures();
  Future<void> searchPictureByDate(ApodDate date);
  void goToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel});
  void dispose();
}

class PicturesStateOld {
  List<PictureViewModel>? pictureViewModelList;
}

class PicturesPresenterImpl
    with LoadingPresenterManager, NavigationPresenterManager
    implements PicturesPresenter {
  final LoadLastTenDaysPicturesByDateUseCase loadLastTenDaysPicturesByDate;

  PicturesPresenterImpl({required this.loadLastTenDaysPicturesByDate});

  final _controller = StreamController<PicturesStateOld>.broadcast();

  final _state = PicturesStateOld();

  void _update() => _controller.add(_state);

  @override
  Stream<List<PictureViewModel>?> get picturesStream =>
      _controller.stream.map((state) => state.pictureViewModelList).distinct();

  @override
  Future<void> loadPictures() async {
    isLoading = true;
    final nowDate = DateTime.now();
    final result = await loadLastTenDaysPicturesByDate.call(nowDate);

    result.fold(
      (domainFailure) {
        _state.pictureViewModelList = null;
        _controller.addError(domainFailure.toUIFailure);
      },
      (pictureEntityList) {
        _state.pictureViewModelList = PictureMapper()
            .fromEntityListToViewModelList(pictureEntityList)
            .fold(
          (domainFailure) {
            return null;
          },
          (pictureViewModelList) {
            return pictureViewModelList.toList().reversed.toList();
          },
        );
      },
    );

    isLoading = false;
    _update();
  }

  @override
  Future<void> searchPictureByDate(ApodDate date) async {
    isLoading = true;

    final datasource = PictureDatasourceImpl(httpClientAdapterFactory());

    final result = await datasource.fetchByDate(apodApiUrlFactory(
        apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
        requestPath: '&date=${date.value}'));

    result.fold(
      (domainFailure) {
        _state.pictureViewModelList = null;
        _controller.addError(domainFailure.toUIFailure);
      },
      (pictureModel) {
        PictureMapper().fromModelToViewModel(pictureModel).fold((exception) {
          return exception;
        }, (pictureViewModel) {
          _state.pictureViewModelList = [
            pictureViewModel,
          ];
        });
      },
    );

    isLoading = false;
    _update();
  }

  @override
  void goToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel}) {
    navigateTo = NavigateToParams(
      routeName: '/$pictureDate',
      arguments: pictureViewModel,
    );
  }

  @override
  void dispose() {
    _controller.close();
    disposeNavigationPresenterManager();
    disposeLoadingPresenterManager();
  }
}
