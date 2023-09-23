import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NasaApodAppBuilder extends StatelessWidget {
  final RouterConfig<Object> routerConfig;
  const NasaApodAppBuilder.router({
    Key? key,
    required this.routerConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => MaterialApp.router(
        title: 'Nasa Apod App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Secular_One',
        ),
        restorationScopeId: 'nasa_apod_app',
        routerConfig: routerConfig,
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}
