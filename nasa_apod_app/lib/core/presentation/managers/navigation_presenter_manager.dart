import 'dart:async';

mixin NavigationPresenterManager {
  final _navigateTo = StreamController<NavigateToParams?>.broadcast();
  Stream<NavigateToParams?> get navigateToStream => _navigateTo.stream;
  set navigateTo(NavigateToParams value) => _navigateTo.sink.add(value);

  void disposeNavigationPresenterManager() {
    _navigateTo.close();
  }
}

class NavigateToParams {
  final String routeName;
  final Object? arguments;
  final bool forRoot;

  NavigateToParams({
    required this.routeName,
    this.arguments,
    this.forRoot = false,
  });
}



// Future<T?> pushNamed<T extends Object?>(
//   String routeName, {
//   Object? arguments,
//   bool forRoot = false,
// })