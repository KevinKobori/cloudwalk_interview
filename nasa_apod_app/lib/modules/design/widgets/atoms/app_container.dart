import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppContainer extends StatelessWidget {
  final AppEdgeInsets? padding;
  final AppEdgeInsets? margin;
  final Decoration? decorationType;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Clip clipBehavior;
  final BoxConstraints? constraints;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;

  const AppContainer({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decorationType,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.constraints,
    this.transform,
    this.transformAlignment,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DesignSystem.of(context).data;
    return Container(
      width: width,
      height: height,
      padding: padding?.toEdgeInsets(theme),
      margin: margin?.toEdgeInsets(theme),
      decoration: decorationType,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
    );
  }
}
