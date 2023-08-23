import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

import '../../../../../apod.dart';

class ApodResponsesFactory with ApodObjectFactory {
  ExternalErrorType generateNotFoundError() => ExternalErrorType.notFound;
}
