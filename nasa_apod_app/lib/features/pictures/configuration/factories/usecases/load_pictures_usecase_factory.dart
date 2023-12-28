import 'package:nasa_apod_app/nasa_apod_app.dart';

String localStorageItemKeyFactory() => 'pictures_list';

RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    remoteLoadPicturesUseCaseFactory() =>
        RemoteLoadLastTenDaysPicturesByDateUseCaseImpl(
          apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
          picturesRepository: pictureRepositoryFactory(),
        );
