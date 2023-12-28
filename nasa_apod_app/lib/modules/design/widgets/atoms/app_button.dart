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
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      style: buttonType.style(theme: theme),
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
  ButtonStyle style({required ThemeData theme}) {
    final borderRadius = theme.data.radius.border;
    final colorScheme = theme.colorScheme;
    switch (this) {
      case AppButtonType.filled:
        return TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: colorScheme.primary,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.38),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius.large,
          ),
        );
      case AppButtonType.outlined:
        return TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          backgroundColor: Colors.white,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.38),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius.large,
            side: BorderSide(
              color: colorScheme.primary,
            ),
          ),
        );
      case AppButtonType.text:
        return TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          backgroundColor: Colors.white,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.38),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius.large,
          ),
        );
    }
  }
}
