part of x_metrics_data;

class XRadiusData {
  final Radius small;
  final Radius medium;
  final Radius large;

  XRadiusData({
    Radius? small,
    Radius? medium,
    Radius? large,
  })  : small = small ?? Radius.circular(const XSpacingsData().small),
        medium = medium ?? Radius.circular(const XSpacingsData().semiSmall),
        large = large ?? Radius.circular(const XSpacingsData().semiLarge);

  XBorderRadiusData get border => XBorderRadiusData(this);
}

class XBorderRadiusData {
  final XRadiusData _radius;

  const XBorderRadiusData(this._radius);

  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.medium);
  BorderRadius get large => BorderRadius.all(_radius.large);
}
