import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final alice = Alice();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.routerDelegate.setNavigatorKey(alice.getNavigatorKey());

    return MaterialApp.router(
      title: 'CloudWalk Test Mobile Engineer 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Secular_One',
      ),
      restorationScopeId: 'app',
      routerConfig: Modular.routerConfig,
    );
  }
}
