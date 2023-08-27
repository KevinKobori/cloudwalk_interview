import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class ApodObjectModel extends ApodObjectEntity {
  ApodObjectModel({
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
    return 'ApodObjectModel(date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }
}
