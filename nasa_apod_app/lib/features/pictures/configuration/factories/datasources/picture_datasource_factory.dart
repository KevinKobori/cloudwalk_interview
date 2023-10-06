import 'package:nasa_apod_app/nasa_apod_app.dart';

PictureDatasourceImpl pictureDatasourceFactory() =>
    PictureDatasourceImpl(httpClientAdapterFactory());
