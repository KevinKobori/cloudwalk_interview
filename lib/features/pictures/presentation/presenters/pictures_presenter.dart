import 'dart:async';
import 'dart:ui';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

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
  void goToPictureDetails(String pictureDate) {
    navigateTo = '/table/$pictureDate/details';
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
