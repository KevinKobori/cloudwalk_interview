import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class PictureEntity extends ApodObject {
  PictureEntity({
    super.copyright,
    required super.date,
    required super.explanation,
    required super.hdurl,
    required super.mediaType,
    required super.serviceVersion,
    required super.title,
    required super.url,
  });

  @override
  String toString() {
    return 'PictureEntity(date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }
}
