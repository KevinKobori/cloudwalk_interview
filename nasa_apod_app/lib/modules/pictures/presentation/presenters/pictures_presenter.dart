import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class IPicturesPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<PictureViewModel>?> get picturesStream;
  Stream<NavigateToParams?> get navigateToStream;
  Future<void> loadPictures();
  Future<void> searchPictureByDate(ApodDate date);
  void goToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel});
  void dispose();
}

class PicturesState {
  List<PictureViewModel>? pictureViewModelList;
}

class PicturesPresenter
    with LoadingPresenterManager, NavigationPresenterManager
    implements IPicturesPresenter {
  ///
  final ILoadPicturesUseCase loadPicturesUseCase;

  PicturesPresenter({
    required this.loadPicturesUseCase,
  });

  ///
  final _controller = StreamController<PicturesState>.broadcast();

  final _state = PicturesState();

  void _update() => _controller.add(_state);

  @override
  Stream<List<PictureViewModel>?> get picturesStream =>
      _controller.stream.map((state) => state.pictureViewModelList).distinct();

  ///
  @override
  Future<void> loadPictures() async {
    try {
      isLoading = true;
      final List<PictureEntity> pictureEntityList =
          await loadPicturesUseCase.loadLastTenDaysData();

      _state.pictureViewModelList =
          PictureMapper().fromEntityListToViewModelList(pictureEntityList).fold(
        (presenterException) {
          return null;
        },
        (pictureViewModelList) {
          return pictureViewModelList.toList().reversed.toList();
        },
      );
    } on DomainException catch (error) {
      _state.pictureViewModelList = null;
      _controller.addError(error.errorType.presenterError.i18nError);
    } finally {
      isLoading = false;
      _update();
    }
  }

  @override
  Future<void> searchPictureByDate(ApodDate date) async {
    await _loadPictureByDate(date);
  }

  Future<void> _loadPictureByDate(ApodDate date) async {
    try {
      isLoading = true;
      final datasource = PictureDatasource(httpClientAdapterFactory());
      final pictureMap = await datasource.fetchByDate(apodApiUrlFactory(
          apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
          requestPath: '&date=${date.value}'));
      if (pictureMap != null) {
        PictureMapper().fromModelToViewModel(pictureMap).fold((exception) {
          return exception;
        }, (pictureViewModel) {
          _state.pictureViewModelList = [
            pictureViewModel,
          ];
        });
      } else {
        _state.pictureViewModelList = null;
        _controller.addError('REMOVE THIS LINE'); // TODO: NOW - REMOVE THIS
      }
    } on DomainException catch (error) {
      _state.pictureViewModelList = null;
      _controller.addError(error.errorType.presenterError.i18nError);
    } finally {
      isLoading = false;
      _update();
    }
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

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
}
