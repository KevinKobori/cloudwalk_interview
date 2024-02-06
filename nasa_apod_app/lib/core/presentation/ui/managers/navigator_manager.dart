import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

abstract final class NavigatorManager {
  static void pop() {
    if (Modular.to.canPop()) {
      Modular.to.pop();
      return;
    }
  }

  static void pushNamed(String route, {dynamic arguments}) {
    if (route == Modular.to.path) {
      return;
    }

    unawaited(Modular.to
            .pushNamed(route, arguments: arguments)
            .onError((error, stackTrace) =>
                // package: RemottelyFlutterException
                // RemoException.handle(
                error)
        // )
        );
  }

  static void navigate(String route, {dynamic arguments}) async {
    if (route == Modular.to.path) {
      return;
    }

    Modular.to.navigate(route, arguments: arguments);
  }
}
