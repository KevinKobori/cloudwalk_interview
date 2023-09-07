import 'dart:async';

mixin LoadingPresenterManager {
  final _isLoading = StreamController<bool>.broadcast();
  Stream<bool> get isLoadingStream => _isLoading.stream;
  set isLoading(bool value) => _isLoading.sink.add(value);

  void disposeLoadingPresenterManager() {
    _isLoading.close();
  }
}
