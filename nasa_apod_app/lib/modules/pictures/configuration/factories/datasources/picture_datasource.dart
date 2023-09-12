import 'package:nasa_apod_app/nasa_apod_app.dart';

PictureDatasource pictureDatasourceFactory() =>
    PictureDatasource(httpClientAdapterFactory());
