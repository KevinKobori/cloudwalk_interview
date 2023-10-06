import 'package:nasa_apod_app/nasa_apod_app.dart';

String localStorageItemKeyFactory() => 'pictures_list';

RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    remoteLoadPicturesUseCaseFactory() =>
        RemoteLoadLastTenDaysPicturesByDateUseCaseImpl(
          apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
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

RemoteLoadLastTenDaysPicturesByDateWithLocalFallbackUseCaseImpl
    remoteLoadPicturesUseCaseWithLocalFallbackFactory() =>
        RemoteLoadLastTenDaysPicturesByDateWithLocalFallbackUseCaseImpl(
          remoteLoadLastTenDaysPicturesByDate:
              remoteLoadPicturesUseCaseFactory(),
          localLoadLastTenDaysPicturesByDate: localLoadPicturesUseCaseFactory(),
          localValidatePictures: localValidatePicturesUseCaseFactory(),
          localSavePictures: localSavePicturesUseCaseFactory(),
        );
