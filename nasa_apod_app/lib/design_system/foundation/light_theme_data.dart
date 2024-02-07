import 'package:nasa_apod_app/design_system/design_system.dart';

class XLightThemeData {
  static final theme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      XMetricsData(),
      XAssetsData(),
    ],
  );
}
