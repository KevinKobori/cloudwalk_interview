part of x_metrics_data;

class XSpacingsData {
  final double none;
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;

  const XSpacingsData({
    double? none,
    double? extraSmall,
    double? small,
    double? semiSmall,
    double? medium,
    double? semiLarge,
    double? large,
    double? extraLarge,
  })  : none = none ?? TkStandardSizeConstants.x0,
        extraSmall = extraSmall ?? TkStandardSizeConstants.x4,
        small = small ?? TkStandardSizeConstants.x8,
        semiSmall = semiSmall ?? TkStandardSizeConstants.x12,
        medium = medium ?? TkStandardSizeConstants.x16,
        semiLarge = semiLarge ?? TkStandardSizeConstants.x20,
        large = large ?? TkStandardSizeConstants.x24,
        extraLarge = extraLarge ?? TkStandardSizeConstants.x32;

  EdgeInsets toInsets() => EdgeInsets.all(none);
}
