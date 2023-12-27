import 'package:alice/alice.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppBuilder extends StatelessWidget {
  final alice = Alice();

  AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.routerDelegate.setNavigatorKey(alice.getNavigatorKey());

    return DesignSystem(
      data: AppThemeData.standard(),
      widgets: AppWidgets(),
      child: ResponsiveApp(
        builder: (_) => MaterialApp.router(
          title: 'Nasa Apod App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.deepPurple,
            fontFamily: 'Secular_One',
          ),
          restorationScopeId: 'nasa_apod_app',
          routerConfig: Modular.routerConfig,
        ),
      ).animate().fadeIn(
            delay: const Duration(milliseconds: 50),
            duration: const Duration(milliseconds: 400),
          ),
    );
  }
}
