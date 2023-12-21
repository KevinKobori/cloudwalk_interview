import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppWidget extends StatelessWidget {
  final alice = Alice();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.routerDelegate.setNavigatorKey(alice.getNavigatorKey());

    return NasaApodAppBuilder.router(
      routerConfig: Modular.routerConfig,
    );
  }
}
