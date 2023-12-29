import 'package:fluttely_core/fluttely_core.dart';

import '../../../../../../apod.dart';

class ApodResponsesFactory with PictureFactory {
  HttpFailure generateNotFoundFailure() => HttpFailure.notFound;
}
