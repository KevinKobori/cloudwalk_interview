// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PictureModel extends Equatable {
  final String copyright;
  final DateTime date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  const PictureModel({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  @override
  String toString() {
    return 'PictureModel(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, media_type: $mediaType, service_version: $serviceVersion, title: $title, url: $url)';
  }

  @override
  List<Object> get props {
    return [
      copyright,
      date,
      explanation,
      hdurl,
      mediaType,
      serviceVersion,
      title,
      url,
    ];
  }
}
