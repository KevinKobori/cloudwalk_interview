import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureModel extends PictureEntity {
  PictureModel({
    required DateTime date,
    required super.explanation,
    required super.hdurl,
    required super.mediaType,
    required super.serviceVersion,
    required super.title,
    required super.url,
  }) : super(
          date: ApodDate(
            year: date.year,
            month: date.month,
            day: date.day,
          ),
        );

  @override
  String toString() {
    return 'PictureModel(date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }
}
