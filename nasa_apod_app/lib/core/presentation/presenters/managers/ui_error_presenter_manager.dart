import 'dart:async';

import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin UIFailurePresenterManager {
  final _mainFailure = StreamController<DomainFailureType?>.broadcast();
  Stream<DomainFailureType?> get mainFailureStream => _mainFailure.stream;
  set mainFailure(DomainFailureType? value) => _mainFailure.sink.add(value);

  void disposeUIFailurePresenterManager() {
    _mainFailure.close();
  }
}
