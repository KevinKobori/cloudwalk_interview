import 'package:gap/gap.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppGap extends StatelessWidget {
  final AppGapSize type;

  const AppGap(this.type, {Key? key}) : super(key: key);

  const AppGap.none({Key? key})
      : type = AppGapSize.none,
        super(key: key);

  const AppGap.extraSmall({Key? key})
      : type = AppGapSize.extraSmall,
        super(key: key);

  const AppGap.small({Key? key})
      : type = AppGapSize.small,
        super(key: key);

  const AppGap.semiSmall({Key? key})
      : type = AppGapSize.semiSmall,
        super(key: key);

  const AppGap.medium({Key? key})
      : type = AppGapSize.medium,
        super(key: key);

  const AppGap.large({Key? key})
      : type = AppGapSize.large,
        super(key: key);

  const AppGap.semiLarge({Key? key})
      : type = AppGapSize.semiLarge,
        super(key: key);

  const AppGap.extraLarge({Key? key})
      : type = AppGapSize.extraLarge,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DesignSystem.of(context).data;
    return Gap(type.size(theme));
  }
}

enum AppGapSize {
  none,
  semiSmall,
  extraSmall,
  small,
  medium,
  semiLarge,
  large,
  extraLarge,
}

extension AppGapSizeExtension on AppGapSize {
  double size(AppThemeData theme) {
    switch (this) {
      case AppGapSize.none:
        return theme.spacings.none;
      case AppGapSize.extraSmall:
        return theme.spacings.extraSmall;
      case AppGapSize.small:
        return theme.spacings.small;
      case AppGapSize.semiSmall:
        return theme.spacings.semiSmall;
      case AppGapSize.medium:
        return theme.spacings.medium;
      case AppGapSize.semiLarge:
        return theme.spacings.semiLarge;
      case AppGapSize.large:
        return theme.spacings.large;
      case AppGapSize.extraLarge:
        return theme.spacings.extraLarge;
    }
  }
}
