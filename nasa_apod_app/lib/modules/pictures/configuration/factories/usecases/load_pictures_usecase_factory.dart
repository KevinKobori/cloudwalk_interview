import 'package:nasa_apod_app/nasa_apod_app.dart';

/// Logic for retrieving Astronomy Picture of the Day (Apod) images
/// from the last 10 days, including today.
String getDateFormat(DateTime time) {
  String year = time.year.toString();

  String month = time.month.toString().padLeft(2, '0');

  String day = time.day.toString().padLeft(2, '0');

  return '$year-$month-$day';
}

final now = DateTime.now();

final nowUS = DateTime(now.year, now.month, now.day, now.hour - 1);
final dateNowUS = getDateFormat(nowUS);

var lastTenDaysUS = DateTime(now.year, now.month, now.day - 9, now.hour - 1);
final dateLastTenDaysUS = getDateFormat(lastTenDaysUS);

String localStorageItemKeyFactory() => 'pictures_list';

RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    remoteLoadPicturesUseCaseFactory() =>
        RemoteLoadLastTenDaysPicturesByDateUseCaseImpl(
          url: apodApiUrlFactory(
            apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
            requestPath: '&start_date=$dateLastTenDaysUS&end_date=$dateNowUS',
          ),
          picturesRepository: pictureRepositoryFactory(),
        );

LocalLoadLastTenDaysPicturesByDateUseCaseImpl
    localLoadPicturesUseCaseFactory() =>
        LocalLoadLastTenDaysPicturesByDateUseCaseImpl(
          localStorage:
              localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
          itemKey: localStorageItemKeyFactory(),
        );

LocalValidatePicturesUseCaseImpl localValidatePicturesUseCaseFactory() =>
    LocalValidatePicturesUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageItemKeyFactory(),
    );

LocalSavePicturesUseCaseImpl localSavePicturesUseCaseFactory() =>
    LocalSavePicturesUseCaseImpl(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
      itemKey: localStorageItemKeyFactory(),
    );

LoadLastTenDaysPicturesByDateUseCase
    remoteLoadPicturesUseCaseWithLocalFallbackFactory() =>
        RemoteLoadPicturesWithLocalFallbackUseCaseImpl(
          remoteLoadLastTenDaysPicturesByDate:
              remoteLoadPicturesUseCaseFactory(),
          localLoadLastTenDaysPicturesByDate: localLoadPicturesUseCaseFactory(),
          localValidatePictures: localValidatePicturesUseCaseFactory(),
          localSavePictures: localSavePicturesUseCaseFactory(),
        );
