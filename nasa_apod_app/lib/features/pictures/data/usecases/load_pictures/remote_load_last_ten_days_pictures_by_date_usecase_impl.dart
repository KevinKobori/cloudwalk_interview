import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class RemoteLoadLastTenDaysPicturesByDateUseCaseImpl
    implements RemoteLoadLastTenDaysPicturesByDateUseCase {
  final PictureRepository picturesRepository;
  final String apiKey;

  RemoteLoadLastTenDaysPicturesByDateUseCaseImpl({
    required this.picturesRepository,
    required this.apiKey,
  });

  
  @override
  Future<Either<DomainFailure, List<PictureEntity>>> call(DateTime date) async {
    /// Logic for retrieving Astronomy Picture of the Day (Apod) images
    /// from the last 10 days, including today.
    final nasaApodEndDate = getNasaApodEndDate(date);
    final nasaApodStartDate = getNasaApodStartDate(date);

    final result = await picturesRepository.getLastTenDaysData(
      apodApiUrlFactory(
        apiKey: apiKey,
        requestPath: '&start_date=$nasaApodStartDate&end_date=$nasaApodEndDate',
      ),
    );
    return result;
  }

  static String getNasaApodEndDate(DateTime date) {
    return getNasaApodDateFormat(date);
  }

  static String getNasaApodStartDate(DateTime date) {
    final lastTenDaysUS =
        DateTime(date.year, date.month, date.day - 9, date.hour - 1);
    return getNasaApodDateFormat(lastTenDaysUS);
  }

  static String getNasaApodDateFormat(DateTime date) {
    final dateRequestAPIFormat =
        DateTime(date.year, date.month, date.day, date.hour - 1);
    final String year = dateRequestAPIFormat.year.toString();
    final String month = dateRequestAPIFormat.month.toString().padLeft(2, '0');
    final String day = dateRequestAPIFormat.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
