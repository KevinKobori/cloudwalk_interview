part of darwin_theme_data;

class AppDurationsData {
  final bool areAnimationEnabled;
  final Duration regular;
  final Duration quick;

  const AppDurationsData({
    required this.areAnimationEnabled,
    required this.regular,
    required this.quick,
  });

  factory AppDurationsData._standard() => const AppDurationsData(
        areAnimationEnabled: true,
        regular: Duration(milliseconds: 250),
        quick: Duration(milliseconds: 100),
      );
}
