import 'package:nasa_apod_app/design_system/design_system.dart';

class XPadding extends StatelessWidget {
  final XEdgeInsets? xPadding;
  final EdgeInsets? padding;
  final Widget? child;

  const XPadding({
    required this.xPadding,
    super.key,
    this.child,
  }) : padding = null;

  const XPadding.custom({
    required this.padding,
    super.key,
    this.child,
  }) : xPadding = null;

  @override
  Widget build(BuildContext context) {
    final XSpacingsData? xSpacing =
        Theme.of(context).extension<XMetricsData>()?.xSpacings;

    return Padding(
      padding:
          xPadding?.toEdgeInsets(xSpacing) ?? padding ?? EdgeInsets.zero,
      child: child,
    );
  }
}
