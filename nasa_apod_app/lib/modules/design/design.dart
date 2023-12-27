// extension AppThemeBuildContext on BuildContext {
//   AppThemeData get theme => AppTheme.of(this);
// }

// extension ThemeDataExtras on ThemeData {
//   AppThemeData get data => AppThemeData.standard();
// }
import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'theme/app_theme_data.dart';
export 'theme/theme.dart';
export 'widgets/widgets.dart';

class DesignSystem extends InheritedWidget {
  final AppThemeData data;
  final AppWidgets widgets;

  const DesignSystem({
    required this.data,
    required this.widgets,
    required Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  static DesignSystem of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<DesignSystem>();
    return widget!;
  }

  @override
  bool updateShouldNotify(covariant DesignSystem oldWidget) {
    return data != oldWidget.data;
  }
}