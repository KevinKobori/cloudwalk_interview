import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class IPicturesPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<PictureViewModel>?> get picturesStream;
  Stream<String?> get navigateToStream;
  // late ValueNotifier<PictureViewModel?> pictureFound;
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

      _state.pictureViewModelList = PictureMapper()
          .fromEntityListToViewModelList(pictureEntityList)
          .when((success) {
        return success.toList().reversed.toList();
      }, (error) {
        return null;
      });
    } on DomainException catch (error) {
      _state.pictureViewModelList = [];
      _controller.addError(error.errorType.presenterError.i18nError);
    } finally {
      isLoading = false;
      _update();
    }
  }

  // @override
  // final pictureFound = ValueNotifier<PictureViewModel?>(null);
  // @override
  // set pictureFound(ValueNotifier<PictureViewModel?> pictureFound) =>
  //     pictureFound = pictureFound;

  @override
  Future<void> searchPictureByDate(ApodDate date) async {
    // final datasource = PictureDatasource(httpClientAdapterFactory());
    // final pictureMap = await datasource.fetchByDate(apodApiUrlFactory(
    //     apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
    //     requestPath: '&date=${date.value}'));
    await _loadPictureByDate(date);
    // pictureFound.value = PictureMapper().fromModelToViewModel(pictureMap);
  }

  Future<void> _loadPictureByDate(ApodDate date) async {
    try {
      isLoading = true;
      final datasource = PictureDatasource(httpClientAdapterFactory());
      final pictureMap = await datasource.fetchByDate(apodApiUrlFactory(
          apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
          requestPath: '&date=${date.value}'));

      _state.pictureViewModelList = [
        PictureMapper().fromModelToViewModel(pictureMap),
      ];

      // PictureMapper()
      //     .fromEntityListToViewModelList(pictureEntityList)
      //     .when((success) {
      //   return success.toList().reversed.toList();
      // }, (error) {
      //   return null;
      // });
    } on DomainException catch (error) {
      _state.pictureViewModelList = [];
      _controller.addError(error.errorType.presenterError.i18nError);
    } finally {
      isLoading = false;
      _update();
    }
  }

  @override
  void goToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel}) {
    // navigateTo = '/$pictureDate';
    Modular.to.pushNamed('/$pictureDate', arguments: pictureViewModel);
  }

  @override
  void dispose() {
    // pictureFound.dispose();
    _controller.close();
    disposeNavigationPresenterManager();
    disposeLoadingPresenterManager();
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
}
