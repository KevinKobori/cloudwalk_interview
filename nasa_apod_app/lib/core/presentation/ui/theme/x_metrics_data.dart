library x_metrics_data;

import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'constants/tk_auxiliary_size_constants.dart';
export 'constants/tk_standard_size_constants.dart';
export 'constants/tk_text_size_constants.dart';

part 'data/x_durations_data.dart';
part 'data/x_icons_data.dart';
part 'data/x_images_data.dart';
part 'data/x_radius_data.dart';
part 'data/x_shadows_data.dart';
part 'data/x_spacings_data.dart';

class XMetricsData extends ThemeExtension<XMetricsData> {
  final XIconsData icons;
  final XRadiusData radius;
  final XSpacingsData spacing;
  final XShadowsData shadows;
  final XDurationsData durations;
  final XImagesData images;

  XMetricsData({
    final XIconsData? icons,
    final XRadiusData? radius,
    final XSpacingsData? spacings,
    final XShadowsData? shadows,
    final XDurationsData? durations,
    final XImagesData? images,
  })  : icons = icons ?? const XIconsData(),
        durations = durations ?? const XDurationsData(),
        images = images ?? XImagesData(),
        radius = radius ?? XRadiusData(),
        shadows = shadows ?? XShadowsData(),
        spacing = spacings ?? const XSpacingsData();

  @override
  ThemeExtension<XMetricsData> lerp(
      ThemeExtension<XMetricsData>? other, double t) {
    if (other is! XMetricsData) {
      return this;
    } else {
      return XMetricsData(
        icons: icons,
        durations: durations,
        images: images,
        radius: radius,
        shadows: shadows,
        spacings: spacing,
      );
    }
  }

  @override
  XMetricsData copyWith({
    XRadiusData? icons,
    XRadiusData? radius,
    XSpacingsData? spacings,
    XShadowsData? shadows,
    XDurationsData? durations,
    XImagesData? images,
  }) {
    return XMetricsData(
      durations: durations ?? this.durations,
      images: images ?? this.images,
      radius: radius ?? this.radius,
      shadows: shadows ?? this.shadows,
      spacings: spacings ?? spacing,
    );
  }

  @override
  String toString() => '''
      SquareStyle(durations: $durations,
      images: $images,
      radius: $radius,
      shadows: $shadows,
      spacings: $spacing)
  ''';
}
