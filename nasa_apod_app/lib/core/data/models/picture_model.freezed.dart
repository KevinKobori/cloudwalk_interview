// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PictureModel _$PictureModelFromJson(Map<String, dynamic> json) {
  return _PictureModel.fromJson(json);
}

/// @nodoc
mixin _$PictureModel {
  String get copyright => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  String get hdurl => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get serviceVersion => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PictureModelCopyWith<PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureModelCopyWith<$Res> {
  factory $PictureModelCopyWith(
          PictureModel value, $Res Function(PictureModel) then) =
      _$PictureModelCopyWithImpl<$Res, PictureModel>;
  @useResult
  $Res call(
      {String copyright,
      DateTime date,
      String explanation,
      String hdurl,
      String mediaType,
      String serviceVersion,
      String title,
      String url});
}

/// @nodoc
class _$PictureModelCopyWithImpl<$Res, $Val extends PictureModel>
    implements $PictureModelCopyWith<$Res> {
  _$PictureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyright = null,
    Object? date = null,
    Object? explanation = null,
    Object? hdurl = null,
    Object? mediaType = null,
    Object? serviceVersion = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      copyright: null == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      hdurl: null == hdurl
          ? _value.hdurl
          : hdurl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceVersion: null == serviceVersion
          ? _value.serviceVersion
          : serviceVersion // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureModelImplCopyWith<$Res>
    implements $PictureModelCopyWith<$Res> {
  factory _$$PictureModelImplCopyWith(
          _$PictureModelImpl value, $Res Function(_$PictureModelImpl) then) =
      __$$PictureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String copyright,
      DateTime date,
      String explanation,
      String hdurl,
      String mediaType,
      String serviceVersion,
      String title,
      String url});
}

/// @nodoc
class __$$PictureModelImplCopyWithImpl<$Res>
    extends _$PictureModelCopyWithImpl<$Res, _$PictureModelImpl>
    implements _$$PictureModelImplCopyWith<$Res> {
  __$$PictureModelImplCopyWithImpl(
      _$PictureModelImpl _value, $Res Function(_$PictureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyright = null,
    Object? date = null,
    Object? explanation = null,
    Object? hdurl = null,
    Object? mediaType = null,
    Object? serviceVersion = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$PictureModelImpl(
      copyright: null == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      hdurl: null == hdurl
          ? _value.hdurl
          : hdurl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceVersion: null == serviceVersion
          ? _value.serviceVersion
          : serviceVersion // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureModelImpl implements _PictureModel {
  const _$PictureModelImpl(
      {required this.copyright,
      required this.date,
      required this.explanation,
      required this.hdurl,
      required this.mediaType,
      required this.serviceVersion,
      required this.title,
      required this.url});

  factory _$PictureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureModelImplFromJson(json);

  @override
  final String copyright;
  @override
  final DateTime date;
  @override
  final String explanation;
  @override
  final String hdurl;
  @override
  final String mediaType;
  @override
  final String serviceVersion;
  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'PictureModel(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureModelImpl &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.hdurl, hdurl) || other.hdurl == hdurl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.serviceVersion, serviceVersion) ||
                other.serviceVersion == serviceVersion) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, copyright, date, explanation,
      hdurl, mediaType, serviceVersion, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureModelImplCopyWith<_$PictureModelImpl> get copyWith =>
      __$$PictureModelImplCopyWithImpl<_$PictureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureModelImplToJson(
      this,
    );
  }
}

abstract class _PictureModel implements PictureModel {
  const factory _PictureModel(
      {required final String copyright,
      required final DateTime date,
      required final String explanation,
      required final String hdurl,
      required final String mediaType,
      required final String serviceVersion,
      required final String title,
      required final String url}) = _$PictureModelImpl;

  factory _PictureModel.fromJson(Map<String, dynamic> json) =
      _$PictureModelImpl.fromJson;

  @override
  String get copyright;
  @override
  DateTime get date;
  @override
  String get explanation;
  @override
  String get hdurl;
  @override
  String get mediaType;
  @override
  String get serviceVersion;
  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$PictureModelImplCopyWith<_$PictureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
