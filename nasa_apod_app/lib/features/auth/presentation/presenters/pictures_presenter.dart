import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class PicturesPresenter {
  void loadPictures();
  void loadPictureByDate(ApodDate date);
  void pushToPictureDetails(String pictureDate,
      {required PictureViewModel pictureViewModel});
}
