// ignore_for_file: public_member_api_docs, sort_constructors_first
part of darwin_theme_data;

class AppSizesData {
  final double none;
  final double extraSmall;
  final double small;
  final double semiSmall;
  final double medium;
  final double semiLarge;
  final double large;
  final double extraLarge;

  const AppSizesData({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.semiSmall,
    required this.medium,
    required this.semiLarge,
    required this.large,
    required this.extraLarge,
  });

  factory AppSizesData._standard() => const AppSizesData(
        none: 0,
        extraSmall: 4,
        small: 8,
        semiSmall: 12,
        medium: 16,
        semiLarge: 20,
        large: 24,
        extraLarge: 32,
      );
}
