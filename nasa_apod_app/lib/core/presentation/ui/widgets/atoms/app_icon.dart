// import 'package:nasa_apod_app/nasa_apod_app.dart';

// class AppIcon extends StatelessWidget {
//   final String data;
//   final Color? color;
//   final AppIconSizeType sizeType;

//   const AppIcon(
//     this.data, {
//     super.key,
//     this.color,
//     this.sizeType = AppIconSizeType.medium,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final XMetricsData metrics = Theme.of(context).extension<XMetricsData>()!;

//     final color = this.color ?? theme.colorScheme.onPrimary;

//     return Text(
//       data,
//       style: TextStyle(
//         fontFamily: metrics.icons.fontFamily,
//         package: metrics.icons.fontPackage,
//         color: color,
//         fontSize: sizeType.toDouble(metrics.metrics),
//         decoration: TextDecoration.none,
//       ),
//     );
//   }
// }

// class AppAnimatedIcon extends StatelessWidget {
//   const AppAnimatedIcon(
//     this.data, {
//     super.key,
//     this.color,
//     this.sizeType = AppIconSizeType.small,
//     this.duration = const Duration(milliseconds: 200),
//   });

//   final String data;
//   final Color? color;
//   final AppIconSizeType sizeType;
//   final Duration duration;

//   bool get isAnimated => duration.inMilliseconds > 0;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     final color = this.color ?? theme.colorScheme.onPrimary;
//     if (!isAnimated) {
//       return AppIcon(
//         data,
//         key: key,
//         color: color,
//         sizeType: sizeType,
//       );
//     }
//     return AnimatedDefaultTextStyle(
//       style: TextStyle(
//         fontFamily: theme.metrics.icons.fontFamily,
//         package: theme.metrics.icons.fontPackage,
//         color: color,
//         fontSize: sizeType.toDouble(theme.metrics),
//         decoration: TextDecoration.none,
//       ),
//       duration: duration,
//       child: Text(data),
//     );
//   }
// }

// enum AppIconSizeType {
//   small,
//   medium,
//   large,
// }

// extension AppIconSizeExtension on AppIconSizeType {
//   double toDouble(XMetricsData theme) {
//     final sizes = theme.icons.sizes;
//     switch (this) {
//       case AppIconSizeType.small:
//         return sizes.small;
//       case AppIconSizeType.medium:
//         return sizes.medium;
//       case AppIconSizeType.large:
//         return sizes.large;
//     }
//   }
// }
