part of darwin_theme_data;

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

  factory AppSpacingsData._standard() => AppSpacingsData(
        none: AppSizesData._standard().none,
        extraSmall: AppSizesData._standard().extraSmall,
        small: AppSizesData._standard().small,
        semiSmall: AppSizesData._standard().semiSmall,
        medium: AppSizesData._standard().medium,
        semiLarge: AppSizesData._standard().semiLarge,
        large: AppSizesData._standard().large,
        extraLarge: AppSizesData._standard().extraLarge,
      );

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
