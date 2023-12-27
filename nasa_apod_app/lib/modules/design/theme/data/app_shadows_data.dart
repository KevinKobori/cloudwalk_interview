part of darwin_theme_data;

class AppShadowsData {
  final BoxShadow small;
  final BoxShadow medium;
  final BoxShadow large;

  const AppShadowsData({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory AppShadowsData._standard() => AppShadowsData(
        small: BoxShadow(
          blurRadius: 2.0,
          spreadRadius: 1.0,
          color: AppPaleteColorsData.white.withOpacity(.4),
        ),
        medium: BoxShadow(
          blurRadius: 4.0,
          spreadRadius: 1.0,
          color: AppPaleteColorsData.white.withOpacity(.4),
        ),
        large: BoxShadow(
          blurRadius: 8.0,
          spreadRadius: 2.0,
          color: AppPaleteColorsData.white.withOpacity(.4),
        ),
      );
}
