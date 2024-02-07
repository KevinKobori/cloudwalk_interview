import 'package:gap/gap.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

enum XSpacingSize {
  none,
  extraSmall,
  semiSmall,
  small,
  medium,
  semiLarge,
  large,
  extraLarge,
}

class XGap extends StatelessWidget {
  final XSpacingSize sizeType;

  const XGap(this.sizeType, {super.key});

  @override
  Widget build(BuildContext context) {
    final XSpacingsData metrics =
        Theme.of(context).extension<XMetricsData>()!.spacing;

    return Gap(sizeType.toDouble(metrics));
  }
}

extension AppGapSizeExtension on XSpacingSize {
  double toDouble(XSpacingsData spacing) {
    switch (this) {
      case XSpacingSize.none:
        return spacing.none;
      case XSpacingSize.extraSmall:
        return spacing.extraSmall;
      case XSpacingSize.small:
        return spacing.small;
      case XSpacingSize.semiSmall:
        return spacing.semiSmall;
      case XSpacingSize.medium:
        return spacing.medium;
      case XSpacingSize.semiLarge:
        return spacing.semiLarge;
      case XSpacingSize.large:
        return spacing.large;
      case XSpacingSize.extraLarge:
        return spacing.extraLarge;
    }
  }
}
