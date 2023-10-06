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
    final dateRequestAPIFormat =
        DateTime(date.year, date.month, date.day, date.hour - 1);
    final datedateUS = getUSDateFormat(dateRequestAPIFormat);

    var lastTenDaysUS =
        DateTime(date.year, date.month, date.day - 9, date.hour - 1);
    final dateLastTenDaysUS = getUSDateFormat(lastTenDaysUS);

    final result = await picturesRepository.getLastTenDaysData(
      apodApiUrlFactory(
        apiKey: apiKey,
        requestPath: '&start_date=$dateLastTenDaysUS&end_date=$datedateUS',
      ),
    );
    return result;
  }

  String getUSDateFormat(DateTime time) {
    String year = time.year.toString();
    String month = time.month.toString().padLeft(2, '0');
    String day = time.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
