import 'package:nasa_apod_app/nasa_apod_app.dart';

PicturesPresenter picturesPresenterFactory() => PicturesCubit(
      loadLastTenDaysPicturesByDate:
          remoteLoadPicturesUseCaseWithLocalFallbackFactory(),
    );
