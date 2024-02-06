import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_entity.freezed.dart';

@freezed
class PictureEntity with _$PictureEntity {
  const factory PictureEntity({
    required String copyright,
    required DateTime date,
    required String explanation,
    required String hdurl,
    required String mediaType,
    required String serviceVersion,
    required String title,
    required String url,
  }) = _PictureEntity;
}
