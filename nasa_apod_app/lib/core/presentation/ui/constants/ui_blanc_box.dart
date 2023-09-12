import 'package:flutter/widgets.dart';

class UIBlancBox {
  static const double _verticalSpaceExtraSmall = 8.0;
  static const double _verticalSpaceSmall = 12.0;
  static const double _verticalSpaceMedium = 16.0;
  static const double _verticalSpaceLarge = 24.0;
  static const double _verticalSpaceExtraLarge = 32.0;

  static const double _horizontalExtraSpaceSmall = 8.0;
  static const double _horizontalSpaceSmall = 12.0;
  static const double _horizontalSpaceMedium = 16.0;
  static const double _horizontalSpaceLarge = 24.0;
  static const double _horizontalSpaceExtraLarge = 32.0;

  static const Widget verticalSpaceExtraSmall =
      SizedBox(height: _verticalSpaceExtraSmall);
  static const Widget verticalSpaceSmall =
      SizedBox(height: _verticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _verticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _verticalSpaceLarge);
  static const Widget verticalSpaceExtraLarge =
      SizedBox(height: _verticalSpaceExtraLarge);

  static const Widget horizontalSpaceExtraSmall =
      SizedBox(width: _horizontalExtraSpaceSmall);
  static const Widget horizontalSpaceSmall =
      SizedBox(width: _horizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _horizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _horizontalSpaceLarge);
  static const Widget horizontalSpaceExtraLarge =
      SizedBox(width: _horizontalSpaceExtraLarge);
}
