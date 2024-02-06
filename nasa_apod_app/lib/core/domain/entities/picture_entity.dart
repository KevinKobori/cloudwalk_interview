import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

part 'picture_entity.freezed.dart';

@freezed
class PictureEntity with _$PictureEntity {
  const factory PictureEntity({
    required String copyright,
    required ApodDate date,
    required String explanation,
    required String hdurl,
    required String mediaType,
    required String serviceVersion,
    required String title,
    required String url,
  }) = _PictureEntity;
}
