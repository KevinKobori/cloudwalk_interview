import 'dart:async';

import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin UIFailurePresenterManager {
  final _mainFailure = StreamController<DomainFailure?>.broadcast();
  Stream<DomainFailure?> get mainFailureStream => _mainFailure.stream;
  set mainFailure(DomainFailure? value) => _mainFailure.sink.add(value);

  void disposeUIFailurePresenterManager() {
    _mainFailure.close();
  }
}
