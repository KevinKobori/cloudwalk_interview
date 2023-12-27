import 'package:gap/gap.dart';

class AppSizes {
  static const double none = 0;
  static const double extraSmall = 4;
  static const double small = 8;
  static const double semiSmall = 12;
  static const double medium = 16;
  static const double semiLarge = 20;
  static const double large = 24;
  static const double extraLarge = 32;
}

class AppGaps {
  static const Gap extraSmall = Gap(AppSizes.extraSmall);
  static const Gap small = Gap(AppSizes.small);
  static const Gap semiSmall = Gap(AppSizes.semiSmall);
  static const Gap medium = Gap(AppSizes.medium);
  static const Gap semiLarge = Gap(AppSizes.semiLarge);
  static const Gap large = Gap(AppSizes.large);
  static const Gap extraLarge = Gap(AppSizes.extraLarge);
}
