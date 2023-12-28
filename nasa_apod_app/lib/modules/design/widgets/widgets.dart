import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'atoms/app_button.dart';
export 'atoms/app_gap.dart';
export 'atoms/app_padding.dart';

class AppGapsSizes {
  static const none = AppGap.none();
  static const extraSmall = AppGap.extraSmall();
  static const small = AppGap.small();
  static const semiSmall = AppGap.semiSmall();
  static const medium = AppGap.medium();
  static const semiLarge = AppGap.semiLarge();
  static const large = AppGap.large();
  static const extraLarge = AppGap.extraLarge();
}

class AppPaddingsSizes {
  static AppPadding staticScreen({required Widget child}) => AppPadding(
        padding: AppEdgeInsetsSizes.staticScreen,
        child: child,
      );

  static AppPadding scrolledScreen({required Widget child}) => AppPadding(
        padding: const AppEdgeInsets.only(
          left: AppGapSize.large,
          top: AppGapSize.none,
          right: AppGapSize.large,
          bottom: AppGapSize.none,
        ),
        child: child,
      );
}

class AppEdgeInsetsSizes {
  static AppEdgeInsets staticScreen = const AppEdgeInsets.large();
}
