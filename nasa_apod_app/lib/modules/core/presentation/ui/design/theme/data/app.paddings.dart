import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppPaddingsSizes {
  static AppPadding staticScreen({required Widget child}) => AppPadding(
        padding: AppEdgeInsetsSizes.staticScreen,
        child: child,
      );

  static AppPadding scrolledScreen({required Widget child}) => AppPadding(
        padding: const AppEdgeInsets.only(
          left: AppGapSizeType.large,
          top: AppGapSizeType.none,
          right: AppGapSizeType.large,
          bottom: AppGapSizeType.none,
        ),
        child: child,
      );
}
