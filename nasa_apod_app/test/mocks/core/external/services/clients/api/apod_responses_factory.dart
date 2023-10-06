import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../../../../../apod.dart';

class ApodResponsesFactory with PictureFactory {
  DataFailureType generateNotFoundFailure() => DataFailureType.notFound;
}
