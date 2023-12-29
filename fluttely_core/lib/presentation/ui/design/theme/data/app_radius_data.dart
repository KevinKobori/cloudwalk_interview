part of app_theme_data;

class AppRadiusData {
  final Radius small;
  final Radius medium;
  final Radius large;

  const AppRadiusData({
    required this.small,
    required this.medium,
    required this.large,
  });

  AppRadiusData._standard()
      : small = Radius.circular(AppSpacingsData._standard().small),
        medium = Radius.circular(AppSpacingsData._standard().semiSmall),
        large = Radius.circular(AppSpacingsData._standard().semiLarge);

  AppBorderRadiusData get border => AppBorderRadiusData(this);
}

class AppBorderRadiusData {
  final AppRadiusData _radius;

  const AppBorderRadiusData(this._radius);

  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.medium);
  BorderRadius get large => BorderRadius.all(_radius.large);
}
