part of darwin_theme_data;

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
      : small = Radius.circular(AppSizesData._standard().small),
        medium = Radius.circular(AppSizesData._standard().semiSmall),
        large = Radius.circular(AppSizesData._standard().semiLarge);

  _AppBorderRadiusData get border => _AppBorderRadiusData(this);
}

class _AppBorderRadiusData {
  final AppRadiusData _radius;

  const _AppBorderRadiusData(this._radius);

  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.medium);
  BorderRadius get large => BorderRadius.all(_radius.large);
}
