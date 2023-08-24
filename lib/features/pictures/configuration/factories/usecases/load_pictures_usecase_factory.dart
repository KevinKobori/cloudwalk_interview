import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

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

var lastTenDaysUS = DateTime(now.year, now.month, now.day - 10, now.hour - 1);
final dateLastTenDaysUS = getDateFormat(lastTenDaysUS);

RemoteLoadPicturesUseCase remoteLoadPicturesUseCaseFactory() =>
    RemoteLoadPicturesUseCase(
      url: apodApiUrlFactory(
        apiKey: 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF',
        requestPath: '&start_date=$dateLastTenDaysUS&end_date=$dateNowUS',
      ),
      picturesRepository: pictureRepositoryFactory(),
    );

LocalLoadPicturesUseCase localLoadPicturesUseCaseFactory() =>
    LocalLoadPicturesUseCase(
      localStorage:
          localStorageAdapterFactory(localStorageConfigKeyPathFactory()),
    );

ILoadPicturesUseCase remoteLoadPicturesUseCaseWithLocalFallbackFactory() =>
    RemoteLoadPicturesWithLocalFallbackUseCase(
      remoteUseCase: remoteLoadPicturesUseCaseFactory(),
      localUseCase: localLoadPicturesUseCaseFactory(),
    );
