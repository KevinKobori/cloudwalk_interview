library app_theme_data;


import 'package:fluttely_core/fluttely_core.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'data/app_durations_data.dart';
part 'data/app_icons_data.dart';
part 'data/app_images_data.dart';
part 'data/app_radius_data.dart';
part 'data/app_shadows_data.dart';
part 'data/app_spacings_data.dart';

class AppThemeSizesData {
  final AppIconsData icons;
  final AppRadiusData radius;
  final AppSpacingsData spacings;
  final AppShadowsData shadows;
  final AppDurationsData durations;
  final AppImagesData images;

  const AppThemeSizesData({
     required this.icons,
     required this.radius,
     required this.spacings,
     required this.shadows,
     required this.durations,
     required this.images,
  });

  factory AppThemeSizesData.standard() => AppThemeSizesData(
        icons: AppIconsData._standard(),
        radius: AppRadiusData._standard(),
        spacings: AppSpacingsData._standard(),
        shadows: AppShadowsData._standard(),
        durations: AppDurationsData._standard(),
        images: AppImagesData._standard(),
      );
}
