import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin NavigationStateManager {
  void handleNavigation(BuildContext context,
      {required Stream<NavigateToParams?> streamView, bool clear = false}) {
    streamView.listen(
      (params) {
        if (params?.routeName != null &&
            params!.routeName.isNotEmpty &&
            params.routeName != lastRoute) {
          lastRoute = params.routeName;
          if (clear == true) {
            Modular.to.navigate(
              params.routeName,
              arguments: params.arguments,
            );
          } else {
            Modular.to.pushNamed(
              params.routeName,
              arguments: params.arguments,
              forRoot: params.forRoot,
            );
          }
        }
      },
    );
  }
}
