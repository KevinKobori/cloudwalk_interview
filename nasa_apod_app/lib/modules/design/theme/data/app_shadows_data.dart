part of app_theme_data;

class AppShadowsData {
  final BoxShadow small;
  final BoxShadow medium;
  final BoxShadow large;

  const AppShadowsData({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory AppShadowsData._standard() {
    final double extraSmall = AppSpacingsData._standard().extraSmall;
    return AppShadowsData(
      small: BoxShadow(
        blurRadius: extraSmall / 2,
        spreadRadius: extraSmall / 4,
        color: Colors.white.withOpacity(.4),
      ),
      medium: BoxShadow(
        blurRadius: extraSmall,
        spreadRadius: extraSmall / 4,
        color: Colors.white.withOpacity(.4),
      ),
      large: BoxShadow(
        blurRadius: extraSmall * 2,
        spreadRadius: extraSmall / 2,
        color: Colors.white.withOpacity(.4),
      ),
    );
  }
}
