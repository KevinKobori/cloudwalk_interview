import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppAlert extends StatelessWidget {
  final String description;
  final AppAlertType alertType;

  const AppAlert.notification(
    BuildContext context, {
    required this.description,
    super.key,
  }) : alertType = AppAlertType.notification;

  @override
  Widget build(BuildContext context) {
    final theme = DesignSystem.of(context).data;
    return AppContainer(
      decorationType: alertType.decoration(theme),
      padding: const AppEdgeInsets.all(AppGapSize.small),
      child: AppText.body(
        description,
        color: theme.colors.primary,
      ),
    );
  }
}

enum AppAlertType {
  notification,
}

extension AppAlertDecorationExtension on AppAlertType {
  Decoration decoration(AppThemeData theme) {
    switch (this) {
      case AppAlertType.notification:
        return const BoxDecoration();
    }
  }
}
