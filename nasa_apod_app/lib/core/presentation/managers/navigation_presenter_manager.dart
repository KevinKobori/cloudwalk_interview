import 'dart:async';

mixin NavigationPresenterManager {
  final _navigateTo = StreamController<String?>.broadcast();
  Stream<String?> get navigateToStream => _navigateTo.stream;
  set navigateTo(String value) => _navigateTo.sink.add(value);

  void disposeNavigationPresenterManager() {
    _navigateTo.close();
  }
}
