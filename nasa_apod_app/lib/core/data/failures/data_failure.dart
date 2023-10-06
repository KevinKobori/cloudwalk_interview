import 'package:nasa_apod_app/nasa_apod_app.dart';

abstract class DataFailure {
  final DataFailureType error;
  DataFailure(this.error);
}
