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

  AppEdgeInsetsSpacingData asInsets() => AppEdgeInsetsSpacingData(this);
}

class AppEdgeInsetsSpacingData {
  const AppEdgeInsetsSpacingData(this._spacing);

  EdgeInsets get extraSmall => EdgeInsets.all(_spacing.extraSmall);
  EdgeInsets get small => EdgeInsets.all(_spacing.small);
  EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
  EdgeInsets get medium => EdgeInsets.all(_spacing.medium);
  EdgeInsets get semiLarge => EdgeInsets.all(_spacing.semiLarge);
  EdgeInsets get large => EdgeInsets.all(_spacing.large);
  EdgeInsets get extraLarge => EdgeInsets.all(_spacing.extraLarge);

  final AppSpacingsData _spacing;
}
