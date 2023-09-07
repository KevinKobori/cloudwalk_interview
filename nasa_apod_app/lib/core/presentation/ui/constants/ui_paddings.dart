import 'package:flutter/widgets.dart';

class UIPaddings {
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
