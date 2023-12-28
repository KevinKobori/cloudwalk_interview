import 'package:nasa_apod_app/nasa_apod_app.dart';

StatefulWidget pictureDetailsFactory(String pictureDate,
        {required PictureViewModel pictureViewModel}) =>
    PictureDetailsPage(pictureDate, pictureViewModel: pictureViewModel);
