import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'atoms/app_alert.dart';
export 'atoms/app_button.dart';
export 'atoms/app_card.dart';
export 'atoms/app_container.dart';
export 'atoms/app_gap.dart';
export 'atoms/app_padding.dart';
export 'atoms/app_text.dart';

class AppWidgets {
  final gap = AppGaps();
  // Widget padding(Widget child) => AppPaddings();
}

class AppGaps {
  final none = const AppGap.none();
  final extraSmall = const AppGap.extraSmall();
  final small = const AppGap.small();
  final semiSmall = const AppGap.semiSmall();
  final medium = const AppGap.medium();
  final semiLarge = const AppGap.semiLarge();
  final large = const AppGap.large();
  final extraLarge = const AppGap.extraLarge();
}

class AppPaddings {
  static const double kPADDING24 = 24.0;
  static const double kPADDING16 = 16.0;
  static const double kPADDING8 = 8.0;
  static const double kPADDING4 = 4.0;
  static const double kPADDING0 = 0.0;

  static const double _kPADDINGSIDE = kPADDING24;

  static const EdgeInsets zero = EdgeInsets.zero;

  static const EdgeInsets listTile = EdgeInsets.fromLTRB(
    _kPADDINGSIDE,
    kPADDING0,
    _kPADDINGSIDE,
    kPADDING16,
  );

  static const EdgeInsets tile = EdgeInsets.symmetric(
    horizontal: kPADDING4,
    vertical: kPADDING4,
  );

  static const EdgeInsets staticScreen = EdgeInsets.fromLTRB(
    _kPADDINGSIDE,
    _kPADDINGSIDE,
    _kPADDINGSIDE,
    _kPADDINGSIDE,
  );

  static const EdgeInsets scrolledScreen = EdgeInsets.fromLTRB(
    _kPADDINGSIDE,
    kPADDING0,
    _kPADDINGSIDE,
    kPADDING0,
  );
}
