import 'package:nasa_apod_app/nasa_apod_app.dart';

class ApodPaddings {
  static XPadding staticScreen({required Widget child}) => XPadding(
        padding: const XEdgeInsets.all(XSpacingSize.large),
        child: child,
      );

  static XPadding scrolledScreen({required Widget child}) => XPadding(
        padding: const XEdgeInsets.only(
          left: XSpacingSize.large,
          top: XSpacingSize.none,
          right: XSpacingSize.large,
          bottom: XSpacingSize.none,
        ),
        child: child,
      );
}
