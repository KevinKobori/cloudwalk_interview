import 'dart:async';

import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin UIErrorPresenterManager {
  final _mainError = StreamController<DomainErrorType?>.broadcast();
  Stream<DomainErrorType?> get mainErrorStream => _mainError.stream;
  set mainError(DomainErrorType? value) => _mainError.sink.add(value);

  void disposeUIErrorPresenterManager() {
    _mainError.close();
  }
}
