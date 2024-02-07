import 'package:nasa_apod_app/nasa_apod_app.dart';

PicturesPagePresenter picturesPresenterFactory() => PicturesPageCubit(
    loadLastTenDaysPicturesByDate:
        remoteLoadPicturesUseCaseWithLocalFallbackFactory());
