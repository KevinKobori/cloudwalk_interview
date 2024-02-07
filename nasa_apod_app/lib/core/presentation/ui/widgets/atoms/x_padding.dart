import 'package:nasa_apod_app/nasa_apod_app.dart';

class XPadding extends StatelessWidget {
  final XEdgeInsets padding;
  final Widget? child;

  const XPadding({
    required this.padding,
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final XMetricsData metrics = Theme.of(context).extension<XMetricsData>()!;

    return Padding(
      padding: padding.toEdgeInsets(metrics),
      child: child,
    );
  }
}

class XEdgeInsets {
  final XSpacingSize left;
  final XSpacingSize top;
  final XSpacingSize right;
  final XSpacingSize bottom;

  const XEdgeInsets.all(XSpacingSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const XEdgeInsets.symmetric({
    XSpacingSize vertical = XSpacingSize.none,
    XSpacingSize horizontal = XSpacingSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const XEdgeInsets.only({
    this.left = XSpacingSize.none,
    this.top = XSpacingSize.none,
    this.right = XSpacingSize.none,
    this.bottom = XSpacingSize.none,
  });

  EdgeInsets toEdgeInsets(XMetricsData theme) {
    return EdgeInsets.only(
      left: left.toDouble(theme.spacing),
      top: top.toDouble(theme.spacing),
      right: right.toDouble(theme.spacing),
      bottom: bottom.toDouble(theme.spacing),
    );
  }
}
