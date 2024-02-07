// import 'package:alice/alice.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppBuilder extends StatelessWidget {
  // final alice = Alice();
  final String title;
  final ThemeData theme;
  // final XMetricsData metrics;

  const AppBuilder({
    required this.title,
    required this.theme,
    // required this.metrics,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Globals.initialize(metrics: metrics);
    // Modular.routerDelegate.setNavigatorKey(alice.getNavigatorKey());

    return ResponsiveApp(
      // TODO: create configuration for this as default config to initialize the application
      builder: (_) => MaterialApp.router(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: theme,
        restorationScopeId: title,
        themeMode: ThemeMode.dark,
        routerConfig: Modular.routerConfig,
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}

// extension AppThemeDataExtension on ThemeData {
//   XMetricsData get metrics => Globals.instance.metrics;
// }
