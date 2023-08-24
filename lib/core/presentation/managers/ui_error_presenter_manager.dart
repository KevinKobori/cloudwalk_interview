import 'dart:async';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

mixin UIErrorPresenterManager {
  final _mainError = StreamController<PresenterErrorType?>.broadcast();
  Stream<PresenterErrorType?> get mainErrorStream => _mainError.stream;
  set mainError(PresenterErrorType? value) => _mainError.sink.add(value);

  void disposeUIErrorPresenterManager() {
    _mainError.close();
  }
}
