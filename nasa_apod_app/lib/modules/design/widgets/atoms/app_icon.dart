import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppIcon extends StatelessWidget {
  final String data;
  final Color? color;
  final AppIconSize size;

  const AppIcon(
    this.data, {
    Key? key,
    this.color,
    this.size = AppIconSize.medium,
  }) : super(key: key);

  const AppIcon.small(
    this.data, {
    Key? key,
    this.color,
  })  : size = AppIconSize.small,
        super(key: key);

  const AppIcon.medium(
    this.data, {
    Key? key,
    this.color,
  })  : size = AppIconSize.medium,
        super(key: key);

  const AppIcon.large(
    this.data, {
    Key? key,
    this.color,
  })  : size = AppIconSize.large,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = this.color ?? theme.colorScheme.onPrimary;

    return Text(
      data,
      style: TextStyle(
        fontFamily: theme.data.icons.fontFamily,
        package: theme.data.icons.fontPackage,
        color: color,
        fontSize: size.resolve(theme.data),
        decoration: TextDecoration.none,
      ),
    );
  }
}

class AppAnimatedIcon extends StatelessWidget {
  const AppAnimatedIcon(
    this.data, {
    Key? key,
    this.color,
    this.size = AppIconSize.small,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final String data;
  final Color? color;
  final AppIconSize size;
  final Duration duration;

  bool get isAnimated => duration.inMilliseconds > 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = this.color ?? theme.colorScheme.onPrimary;
    if (!isAnimated) {
      return AppIcon(
        data,
        key: key,
        color: color,
        size: size,
      );
    }
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontFamily: theme.data.icons.fontFamily,
        package: theme.data.icons.fontPackage,
        color: color,
        fontSize: size.resolve(theme.data),
        decoration: TextDecoration.none,
      ),
      duration: duration,
      child: Text(
        data,
      ),
    );
  }
}

enum AppIconSize {
  small,
  medium,
  large,
}

extension AppIconSizeExtension on AppIconSize {
  double resolve(AppThemeData theme) {
    final sizes = theme.icons.sizes;
    switch (this) {
      case AppIconSize.small:
        return sizes.small;
      case AppIconSize.medium:
        return sizes.medium;
      case AppIconSize.large:
        return sizes.large;
    }
  }
}
