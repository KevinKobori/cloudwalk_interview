import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppButton extends StatelessWidget {
  final AppButtonType buttonType;
  final String label;
  final void Function()? onPressed;

  const AppButton.filled({
    required this.label,
    required this.onPressed,
    super.key,
  }) : buttonType = AppButtonType.filled;

  const AppButton.outlined({
    required this.label,
    required this.onPressed,
    super.key,
  }) : buttonType = AppButtonType.outlined;

  const AppButton.text({
    required this.label,
    required this.onPressed,
    super.key,
  }) : buttonType = AppButtonType.text;

  @override
  Widget build(BuildContext context) {
    final theme = DesignSystem.of(context).data;
    return TextButton(
      onPressed: onPressed,
      style: buttonType.style(theme),
      child: Text(label),
    );
  }
}

enum AppButtonType {
  filled,
  outlined,
  text,
}

extension AppButtonStyleExtension on AppButtonType {
  ButtonStyle style(AppThemeData theme) {
    final colors = theme.colors;
    final borderRadius = theme.radius.border;
    switch (this) {
      case AppButtonType.filled:
        return TextButton.styleFrom(
          foregroundColor: colors.white,
          backgroundColor: colors.primary,
          disabledBackgroundColor: colors.disabled,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius.large,
          ),
        );
      case AppButtonType.outlined:
        return TextButton.styleFrom(
          foregroundColor: colors.primary,
          backgroundColor: colors.white,
          disabledBackgroundColor: colors.disabled,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius.large,
            side: BorderSide(
              color: colors.primary,
            ),
          ),
        );
      case AppButtonType.text:
        return TextButton.styleFrom(
          foregroundColor: colors.primary,
          backgroundColor: colors.white,
          disabledBackgroundColor: colors.disabled,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius.large,
          ),
        );
    }
  }
}
