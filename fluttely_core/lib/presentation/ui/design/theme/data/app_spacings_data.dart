part of app_theme_data;

class AppSpacingsData {
  final double none;
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;

  const AppSpacingsData({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.semiSmall,
    required this.medium,
    required this.semiLarge,
    required this.large,
    required this.extraLarge,
  });

  factory AppSpacingsData._standard() {
    return const AppSpacingsData(
      none: 0,
      extraSmall: 4,
      small: 8,
      semiSmall: 12,
      medium: 16,
      semiLarge: 20,
      large: 24,
      extraLarge: 32,
    );
  }

  EdgeInsets toInsets() => EdgeInsets.all(none);
}
