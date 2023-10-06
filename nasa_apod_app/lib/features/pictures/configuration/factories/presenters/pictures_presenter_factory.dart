import 'package:nasa_apod_app/nasa_apod_app.dart';

PicturesPresenter picturesPresenterFactory() => PicturesPresenterImpl(
      loadLastTenDaysPicturesByDate:
          remoteLoadPicturesUseCaseWithLocalFallbackFactory(),
    );
