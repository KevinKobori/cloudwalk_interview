import 'package:nasa_apod_app/nasa_apod_app.dart';

IPicturesPresenter picturesPresenterFactory() => PicturesPresenter(
      loadPicturesUseCase: remoteLoadPicturesUseCaseWithLocalFallbackFactory(),
    );
