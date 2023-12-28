import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppEdgeInsets {
  final AppGapSize left;
  final AppGapSize top;
  final AppGapSize right;
  final AppGapSize bottom;

  const AppEdgeInsets.all(AppGapSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const AppEdgeInsets.symmetric({
    AppGapSize vertical = AppGapSize.none,
    AppGapSize horizontal = AppGapSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const AppEdgeInsets.only({
    this.left = AppGapSize.none,
    this.top = AppGapSize.none,
    this.right = AppGapSize.none,
    this.bottom = AppGapSize.none,
  });

  const AppEdgeInsets.extraSmall()
      : left = AppGapSize.extraSmall,
        top = AppGapSize.extraSmall,
        right = AppGapSize.extraSmall,
        bottom = AppGapSize.extraSmall;

  const AppEdgeInsets.small()
      : left = AppGapSize.small,
        top = AppGapSize.small,
        right = AppGapSize.small,
        bottom = AppGapSize.small;

  const AppEdgeInsets.medium()
      : left = AppGapSize.medium,
        top = AppGapSize.medium,
        right = AppGapSize.medium,
        bottom = AppGapSize.medium;

  const AppEdgeInsets.large()
      : left = AppGapSize.large,
        top = AppGapSize.large,
        right = AppGapSize.large,
        bottom = AppGapSize.large;

  const AppEdgeInsets.extraLarge()
      : left = AppGapSize.extraLarge,
        top = AppGapSize.extraLarge,
        right = AppGapSize.extraLarge,
        bottom = AppGapSize.extraLarge;

  EdgeInsets toEdgeInsets(AppThemeData theme) {
    return EdgeInsets.only(
      left: left.toDouble(theme),
      top: top.toDouble(theme),
      right: right.toDouble(theme),
      bottom: bottom.toDouble(theme),
    );
  }
}

class AppPadding extends StatelessWidget {
  const AppPadding({
    Key? key,
    this.padding = const AppEdgeInsets.all(AppGapSize.none),
    this.child,
  }) : super(key: key);

  const AppPadding.extraSmall({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.none),
        super(key: key);

  const AppPadding.small({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.small),
        super(key: key);

  const AppPadding.medium({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.medium),
        super(key: key);

  const AppPadding.large({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.large),
        super(key: key);

  const AppPadding.extraLarge({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.extraLarge),
        super(key: key);

  final AppEdgeInsets padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).data;
    return Padding(
      padding: padding.toEdgeInsets(theme),
      child: child,
    );
  }
}
