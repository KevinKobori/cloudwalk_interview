import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppEdgeInsets {
  final AppGapSizeType left;
  final AppGapSizeType top;
  final AppGapSizeType right;
  final AppGapSizeType bottom;

  const AppEdgeInsets.all(AppGapSizeType value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const AppEdgeInsets.symmetric({
    AppGapSizeType vertical = AppGapSizeType.none,
    AppGapSizeType horizontal = AppGapSizeType.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const AppEdgeInsets.only({
    this.left = AppGapSizeType.none,
    this.top = AppGapSizeType.none,
    this.right = AppGapSizeType.none,
    this.bottom = AppGapSizeType.none,
  });

  EdgeInsets toEdgeInsets(AppThemeSizesData theme) {
    return EdgeInsets.only(
      left: left.toDouble(theme),
      top: top.toDouble(theme),
      right: right.toDouble(theme),
      bottom: bottom.toDouble(theme),
    );
  }
}

class AppPadding extends StatelessWidget {
  final AppEdgeInsets padding;
  final Widget? child;

  const AppPadding({
    required this.padding,
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).data;
    return Padding(
      padding: padding.toEdgeInsets(theme),
      child: child,
    );
  }
}
