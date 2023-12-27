import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppText extends StatelessWidget {
  final String data;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;

  const AppText.title(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title,
        super(key: key);

  const AppText.body(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.body,
        super(key: key);

  const AppText.paragraph(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.paragraph,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DesignSystem.of(context).data;
    final color = this.color ?? theme.colors.black;
    final style = () {
      switch (level) {
        case AppTextLevel.paragraph:
          return theme.typographies.paragraph;
        case AppTextLevel.title:
          return theme.typographies.title;
        case AppTextLevel.body:
          return theme.typographies.body;
      }
    }();
    return Text(
      data,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
    );
  }
}

enum AppTextLevel {
  title,
  body,
  paragraph,
}
