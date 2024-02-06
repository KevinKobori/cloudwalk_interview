import 'package:intl/intl.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract final class DateTimeMapper {
  static const int _kMaxTimeStamp = 21459168000000;
  static const int _kMaxTimeStampSeconds = 99999999999;
  static String _timeFormat = DateFormatType.h24Mm.value;
  static String _dateFormat = DateFormatType.ddMmYyyy.value;
  static String _dateTimeFormat = DateFormatType.h24MmDdMmYyyy.value;

  static void setFormat({
    String? timeFormat,
    String? dateFormat,
    String? dateTimeFormat,
  }) {
    _timeFormat = timeFormat ?? _timeFormat;
    _dateFormat = dateFormat ?? _dateFormat;
    _dateTimeFormat = dateTimeFormat ?? _dateTimeFormat;
  }

  static String getDateStringFromDateTime(DateTime date, {String? format}) {
    return DateFormat(format ?? _dateFormat).format(
      date,
    );
  }

  static int getTimestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String getStringHourFromDuration(Duration duration) {
    String padZero(int n) => n.toString().padLeft(2, '0');
    final String min = padZero(duration.inMinutes.remainder(60));
    final String sec = padZero(duration.inSeconds.remainder(60));
    return '${padZero(duration.inHours)}:$min:$sec';
  }

  static Duration getDurationFromString(String data) {
    late int hours = 0;
    late int minutes = 0;
    late int micros;
    final List<String> parts = data.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = double.parse(parts[parts.length - 1]).round();
    return Duration(hours: hours, minutes: minutes, seconds: micros);
  }

  @Deprecated('Function makes no sense. '
      'It will be removed. Replace with the correct method []')
  static DateTime getDurationFromDateTime(Duration duration) {
    final DateTime date = DateTime.now().add(duration);
    return date;
  }

  static DateTime getDateTimeFromTimestamp(
    int timestamp, {
    bool isUtc = false,
  }) {
    return DateTime.fromMillisecondsSinceEpoch(
      assertTimestamp(timestamp),
      isUtc: isUtc,
    );
  }

  static String getDateAndTimeStringFromTimestamp(
    int timestamp, {
    bool useDash = false,
    bool isUtc = false,
    String? format,
  }) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      assertTimestamp(timestamp),
      isUtc: isUtc,
    );
    if (useDash) {
      final String dashed =
          (format ?? _dateTimeFormat).replaceAll('/', '-').replaceAll(':', '-');
      return DateFormat(dashed).format(dateTime);
    }

    return DateFormat(format ?? _dateTimeFormat).format(dateTime);
  }

  static String getDateStringFromTimestamp(
    int timestamp, {
    bool isUtc = false,
    String? format,
  }) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        assertTimestamp(timestamp),
        isUtc: isUtc);
    return DateFormat(format ?? _dateFormat).format(dateTime);
  }

  static String getTimeStringFromTimestamp(
    int timestamp, {
    bool isUtc = false,
    String? format,
  }) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      assertTimestamp(timestamp),
      isUtc: isUtc,
    );
    return DateFormat(format ?? _timeFormat).format(dateTime);
  }

  static String getHourFromDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String formatHourAndMinute(Duration therapyTime) {
    //final formattedTime = DateFormat('HH\'h\'mm\'min\'').format(dateTime);

    final String formatTherapyTime =
        '${therapyTime.inHours}h${therapyTime.inMinutes.remainder(60)}min';

    return formatTherapyTime;
  }

  static DateTime getYMDFromDateTime(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String getStringFromDateTimeYMD(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

  static String getStringHMSectionsFromDuration(
    Duration duration, {
    bool isTextDivision = false,
  }) {
    String padZero(int n) => n.toString().padLeft(2, '0');
    final String hours = padZero(duration.inHours);
    final String minutes = padZero(duration.inMinutes.remainder(60));

    if (isTextDivision) {
      return '$hours h $minutes min';
    }

    return '$hours:$minutes';
  }

  static String getStringHMSectionsFromTimestamp(
    int duration, {
    bool isTextDivision = false,
  }) {
    final Duration timestamp = Duration(milliseconds: duration);

    String padZero(int n) => n.toString().padLeft(2, '0');

    final String hours = padZero(timestamp.inHours);
    final String minutes = padZero(timestamp.inMinutes.remainder(60));

    if (isTextDivision) {
      return '$hours h $minutes min';
    }
    return '$hours:$minutes';
  }

  static int assertTimestamp(
    int timestamp,
  ) {
    if (timestamp < 0) {
      timestamp = timestamp.abs();
    }

    if (timestamp < _kMaxTimeStampSeconds) {
      timestamp = timestamp * 1000;
    }

    if (timestamp < _kMaxTimeStamp) {
      return timestamp;
    }

    late int finalTimestamp = timestamp;

    finalTimestamp = int.parse(timestamp.toString().substring(0, 14));

    return finalTimestamp >= _kMaxTimeStamp ? _kMaxTimeStamp : finalTimestamp;
  }

  static bool isSameDate(DateTime first, {DateTime? second}) {
    second ??= DateTime.now();
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }
}
