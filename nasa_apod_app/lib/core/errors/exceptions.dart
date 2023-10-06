import 'package:nasa_apod_app/nasa_apod_app.dart';

class ServerException extends DataException {
  ServerException(super.error);
}

class CacheException extends DataException {
  CacheException(super.error);
}

class MapperException extends DataException {
  MapperException(super.error);
}
