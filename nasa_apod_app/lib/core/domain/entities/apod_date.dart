import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_date.freezed.dart';

@freezed
class ApodDate with _$ApodDate {
  const factory ApodDate({
    required int year,
    required int month,
    required int day,
  }) = _ApodDate;
}
