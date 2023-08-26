import 'dart:async';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PicturesState {
  List<PictureViewModel>? pictureViewModelList;
}

class PicturesPresenter
    with LoadingPresenterManager, NavigationPresenterManager
    implements IPicturesPresenter {
  final ILoadPicturesUseCase loadPictures;

  PicturesPresenter({
    required this.loadPictures,
  });

  final _controller = StreamController<PicturesState>.broadcast();

  final _state = PicturesState();

  void _update() => _controller.add(_state);

  @override
  Stream<List<PictureViewModel>?> get picturesStream =>
      _controller.stream.map((state) => state.pictureViewModelList).distinct();

  @override
  Future<void> loadData() async {
    try {
      isLoading = true;
      final List<PictureEntity> pictureEntityList =
          await loadPictures.loadLastTenDaysData();
      _state.pictureViewModelList = pictureEntityList
          .map((pictureEntity) => PictureViewModel(
                date: pictureEntity.date,
                explanation: pictureEntity.explanation,
                hdurl: pictureEntity.hdurl,
                mediaType: pictureEntity.mediaType,
                serviceVersion: pictureEntity.serviceVersion,
                title: pictureEntity.title,
                url: pictureEntity.url,
              ))
          .toList()
          .reversed
          .toList();
    } on DomainException catch (error) {
      _state.pictureViewModelList = [];
      _controller.addError(error.errorType.presentationError.i18nError);
    } finally {
      isLoading = false;
      _update();
    }
  }

  @override
  ValueNotifier<PictureViewModel?> get pictureFound =>
      ValueNotifier<PictureViewModel?>(null);
  @override
  set pictureFound(ValueNotifier<PictureViewModel?> pictureFound) {
    pictureFound = pictureFound;
  }

  @override
  Future<void> searchPictureByDate(String date) async {
    final datasource = PictureDatasource(httpClientAdapterFactory());
    final pictureMap = await datasource.fetchByDate(apodApiUrlFactory(
        apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
        requestPath: '&date=$date'));

    pictureFound.value = await PicturesMapper().fromMapToViewModel(pictureMap);
  }

  @override
  void goToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel}) {
    // navigateTo = '/pictures/$pictureDate';
    Modular.to.pushNamed('/pictures/$pictureDate', arguments: pictureViewModel);
  }

  @override
  void dispose() {
    pictureFound.dispose();
    _controller.close();
    disposeNavigationPresenterManager();
    disposeLoadingPresenterManager();
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
}
