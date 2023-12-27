part of darwin_theme_data;

class AppTypographiesData {
  final TextStyle title;
  final TextStyle body;
  final TextStyle paragraph;

  const AppTypographiesData({
    required this.title,
    required this.body,
    required this.paragraph,
  });

  factory AppTypographiesData._standard() => const AppTypographiesData(
        title: TextStyle(
          fontFamily: 'Gelion',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
        ),
        body: TextStyle(
          fontFamily: 'Gelion',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          decoration: TextDecoration.none,
        ),
        paragraph: TextStyle(
          fontFamily: 'Gelion',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          decoration: TextDecoration.none,
        ),
      );
}
