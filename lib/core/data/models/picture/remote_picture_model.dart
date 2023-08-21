import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class RemotePictureModel {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;  
  final String title;
  final String url;

  RemotePictureModel({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,  
    required this.serviceVersion,  
    required this.title,
    required this.url,
  });

  factory RemotePictureModel.fromJson(Map<String, dynamic> json) {
    if (!json.keys
        .toSet()
        .containsAll([
          'date',
          'explanation',
          'hdurl',
          'media_type',
          'service_version',
          'title',
          'url'
        ])) {
      throw Exception();
    }
    return RemotePictureModel(
      date: json['date']  as String,
      explanation: json['explanation'] as String,
      hdurl: json['hdurl'] as String,
      mediaType: json['mediaType'] as String,
      serviceVersion: json['serviceVersion'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }

  PictureEntity toEntity() => PictureEntity(
    date: date,
    explanation: explanation,
    hdurl:hdurl ,
    mediaType:mediaType ,
    serviceVersion:serviceVersion ,
    title:title ,
    url:url ,
  );
}
