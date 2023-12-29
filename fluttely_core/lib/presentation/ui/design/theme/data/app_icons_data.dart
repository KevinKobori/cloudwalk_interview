part of app_theme_data;

class AppIconsData {
  final String fontFamily;
  final String? fontPackage;
  final AppIconCharactersData characters;
  final AppIconSizesData sizes;

  const AppIconsData({
    required this.fontFamily,
    required this.fontPackage,
    required this.characters,
    required this.sizes,
  });

  factory AppIconsData._standard() => AppIconsData(
        fontFamily: 'app_icons',
        fontPackage: 'nasa_apod_app',
        characters: AppIconCharactersData._standard(),
        sizes: AppIconSizesData._standard(),
      );
}

class AppIconCharactersData {
  const AppIconCharactersData();

  factory AppIconCharactersData._standard() => const AppIconCharactersData();
}

class AppIconSizesData {
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;

  const AppIconSizesData({
    required this.extraSmall,
    required this.small,
    required this.semiSmall,
    required this.medium,
    required this.semiLarge,
    required this.large,
    required this.extraLarge,
  });

  factory AppIconSizesData._standard() {
    final appSizes = AppSpacingsData._standard();

    return AppIconSizesData(
      extraSmall: appSizes.extraSmall,
      small: appSizes.small,
      semiSmall: appSizes.semiSmall,
      medium: appSizes.medium,
      semiLarge: appSizes.semiLarge,
      large: appSizes.large,
      extraLarge: appSizes.extraLarge,
    );
  }
}
