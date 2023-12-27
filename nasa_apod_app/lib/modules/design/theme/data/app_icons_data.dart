part of darwin_theme_data;

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
        fontFamily: 'darwin_icons',
        fontPackage: 'nasa_apod_app',
        characters: AppIconCharactersData._standard(),
        sizes: AppIconSizesData._standard(),
      );
}

class AppIconCharactersData {
  const AppIconCharactersData();

  factory AppIconCharactersData._standard() =>
      const AppIconCharactersData();
}

class AppIconSizesData {
  final double small;
  final double medium;
  final double large;

  const AppIconSizesData({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory AppIconSizesData._standard() => AppIconSizesData(
        small: AppSizesData._standard().medium,
        medium: AppSizesData._standard().large,
        large: AppSizesData._standard().extraLarge,
      );
}
