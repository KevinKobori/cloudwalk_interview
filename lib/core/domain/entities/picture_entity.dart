class PictureEntity {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;  
  final String title;
  final String url;

  PictureEntity({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,  
    required this.serviceVersion,  
    required this.title,
    required this.url,
  });

  @override
  bool operator ==(covariant PictureEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
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
