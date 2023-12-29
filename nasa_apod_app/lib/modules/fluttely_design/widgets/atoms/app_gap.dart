import 'package:gap/gap.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppGap extends StatelessWidget {
  final AppGapSizeType sizeType;

  const AppGap(this.sizeType, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).data;
    return Gap(sizeType.toDouble(theme));
  }
}

enum AppGapSizeType {
  none,
  extraSmall,
  semiSmall,
  small,
  medium,
  semiLarge,
  large,
  extraLarge,
}

extension AppGapSizeExtension on AppGapSizeType {
  double toDouble(AppThemeData theme) {
    switch (this) {
      case AppGapSizeType.none:
        return theme.spacings.none;
      case AppGapSizeType.extraSmall:
        return theme.spacings.extraSmall;
      case AppGapSizeType.small:
        return theme.spacings.small;
      case AppGapSizeType.semiSmall:
        return theme.spacings.semiSmall;
      case AppGapSizeType.medium:
        return theme.spacings.medium;
      case AppGapSizeType.semiLarge:
        return theme.spacings.semiLarge;
      case AppGapSizeType.large:
        return theme.spacings.large;
      case AppGapSizeType.extraLarge:
        return theme.spacings.extraLarge;
    }
  }
}
