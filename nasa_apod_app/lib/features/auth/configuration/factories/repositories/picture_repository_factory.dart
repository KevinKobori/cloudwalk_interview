import 'package:nasa_apod_app/nasa_apod_app.dart';

PictureRepositoryImpl pictureRepositoryFactory() => PictureRepositoryImpl(
      networkInfo: networkInfoFactory(),
      pictureDatasource: pictureDatasourceFactory(),
    );
