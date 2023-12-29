import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'theme/app_theme_data.dart';
export 'theme/data/app.edge_insets.list.dart';
export 'theme/data/app.gaps.dart';
export 'theme/data/app.paddings.dart';
export 'widgets/widgets.dart';

extension AppThemeDataExtension on ThemeData {
  AppThemeData get data => AppThemeData.standard();
}
