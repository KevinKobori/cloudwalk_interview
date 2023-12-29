import 'package:flutter/material.dart';

enum AppTextStyle {
  title,
  body,
  caption,
  button,
  overline,
}

class AppText extends StatelessWidget {
  final String data;
  final AppTextStyle style;

  const AppText.title(
    this.data, {
    super.key,
  }) : style = AppTextStyle.title;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Text(
      data,
      style: style,
    );
  }
}
