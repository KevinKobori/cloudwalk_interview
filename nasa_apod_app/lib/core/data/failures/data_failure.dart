import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class DataFailure extends DomainFailure {
  DataFailure(DataFailureType error) : super(error.domainFailure);
}
