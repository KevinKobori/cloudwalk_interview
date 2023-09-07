import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

mixin NavigationStateManager {
  void handleNavigation(BuildContext context,
      {required Stream<String?> streamView, bool clear = false}) {
    streamView.listen(
      (view) {
        if (view != null && view.isNotEmpty && view != lastRoute) {
          lastRoute = view;
          if (clear == true) {
            Modular.to.navigate(view);
          } else {
            Modular.to.pushNamed(view);
          }
        }
      },
    );
  }
}
