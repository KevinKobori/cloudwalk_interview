import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';
part 'picture_model.g.dart';

@freezed
class PictureModel with _$PictureModel {
  const factory PictureModel({
    required String copyright,
    required DateTime date,
    required String explanation,
    required String hdurl,
    required String mediaType,
    required String serviceVersion,
    required String title,
    required String url,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, Object?> json) =>
      _$PictureModelFromJson(json);
}
