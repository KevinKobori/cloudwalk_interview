class ApodObjectEntity {
  final ApodDate date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  ApodObjectEntity({
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
    return 'ApodObject(date: $date, explanation: $explanation, hdurl: $hdurl, media_type: $mediaType, service_version: $serviceVersion, title: $title, url: $url)';
  }

  @override
  bool operator ==(covariant ApodObjectEntity other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.explanation == explanation &&
        other.hdurl == hdurl &&
        other.mediaType == mediaType &&
        other.serviceVersion == serviceVersion &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        explanation.hashCode ^
        hdurl.hashCode ^
        mediaType.hashCode ^
        serviceVersion.hashCode ^
        title.hashCode ^
        url.hashCode;
  }
}

class ApodDate {
  final int year;
  final int month;
  final int day;

  String get value => '$year-$month-$day';

  ApodDate({
    required this.year,
    required this.month,
    required this.day,
  });
}
