import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class PicturesState {}

class PicturesIdle extends PicturesState {}

class PicturesLoading extends PicturesState {}

class PicturesLoaded extends PicturesState {
  final List<PictureViewModel>? pictureViewModelList;

  PicturesLoaded(this.pictureViewModelList);
}

class PicturesError extends PicturesState {
  final String message;

  PicturesError(this.message);
}
