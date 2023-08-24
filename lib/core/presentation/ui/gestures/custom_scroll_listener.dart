import 'package:flutter/material.dart';

class CustomScrollListener extends ChangeNotifier {
  double appBar = 0;
  double backgroundHeader = 0;
  double lastAppBar = 0;
  double lastBackground = 0;

  CustomScrollListener.initialise(
      {required ScrollController controller, required double height}) {
    final appBarheight = height - 12;
    controller.addListener(() {
      final current = controller.offset;
      appBar += lastAppBar - current;
      if (appBar <= -appBarheight) appBar = -appBarheight;
      if (appBar >= 0) appBar = 0;
      lastAppBar = current;
      if (appBar <= 0 && appBar >= -appBarheight) {}

      final current2 = controller.offset / 1.4;
      backgroundHeader += lastBackground - current2;
      if (backgroundHeader <= -height) backgroundHeader = -height;
      if (backgroundHeader >= 0) backgroundHeader = 0;
      lastBackground = current2;
      if (backgroundHeader <= 0 && backgroundHeader >= -height) {
        notifyListeners();
      }
    });
  }
}
