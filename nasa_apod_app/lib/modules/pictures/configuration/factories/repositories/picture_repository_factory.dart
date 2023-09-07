import 'package:nasa_apod_app/nasa_apod_app.dart';

PictureRepository pictureRepositoryFactory() =>
    PictureRepository(pictureDatasourceFactory());
