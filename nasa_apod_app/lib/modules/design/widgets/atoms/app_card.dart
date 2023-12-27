// import 'package:flutter/material.dart';
// import 'package:nasa_apod_app/nasa_apod_app.dart';

// class AppCard extends AppContainer {
//   final bool isDark;
//   final InsuranceStatusType? insuranceStatus;
//   final AppCardHeader? header;
//   final AppGap? gap;
//   final AppDiscountContainer? discount;
//   final AppCardDetails details;
//   final AppCardStatus? status;
//   final AppButton? button;

//   const AppCard.action({
//     required this.details, super.key,
//     this.isDark = false,
//     this.header,
//     this.gap,
//   })  : insuranceStatus = null,
//         discount = null,
//         status = null,
//         button = null;

//   const AppCard.insurance({
//     required this.insuranceStatus, required this.header, required this.gap, required this.details, super.key,
//     this.discount,
//     this.status,
//     this.button,
//   }) : isDark = false;

//   @override
//   StatelessWidget build(BuildContext context) {
//     final theme = DesignSystem.of(context).data2;
//     return AppContainer(
//       decorationType: BoxDecoration(
//         borderRadius: theme.radius.border.large,
//         color: insuranceStatus?.color(context),
//       ),
//       padding: AppEdgeInsets.only(
//           left: insuranceStatus == null
//               ? AppGapSize.none
//               : AppGapSize.extraSmall),
//       child: AppContainer(
//         decorationType: BoxDecoration(
//           borderRadius: theme.radius.border.large,
//           color: isDark ? theme.colors.primary : Colors.white,
//         ),
//         padding: const AppEdgeInsets.only(
//           left: AppGapSize.medium,
//           top: AppGapSize.small,
//           right: AppGapSize.medium,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             header ?? const gap.none(),
//             gap ?? const gap.none(),
//             discount ?? const gap.none(),
//             discount == null
//                 ? const gap.none()
//                 : const gap.medium(),
//             details,
//             const gap.small(),
//             status == null ? const gap.small() : const gap.none(),
//             status ?? const gap.none(),
//             status == null ? const gap.none() : const gap.medium(),
//             button ?? const gap.none(),
//             button == null ? const gap.none() : const gap.small(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AppCardHeader extends StatelessWidget {
//   final InsuranceStatusType? insuranceStatus;
//   final String title;
//   final String subtitle;

//   const AppCardHeader.action({
//     required this.title, required this.subtitle, super.key,
//   }) : insuranceStatus = null;

//   const AppCardHeader.insurance({
//     required this.insuranceStatus, required this.title, required this.subtitle, super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = DesignSystem.of(context).data2;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             insuranceStatus != null
//                 ? const gap.none()
//                 : Row(
//                     children: [
//                       CustomDotColor(
//                         color: theme.colors.white,
//                         size: theme.sizes.dot,
//                         boxShadow: [theme.shadows.large],
//                       ),
//                       const gap.small(),
//                     ],
//                   ),
//             AppText.body(
//               title,
//               color: insuranceStatus?.color(context) ?? theme.colors.white,
//             ),
//           ],
//         ),
//         AppText.body(
//           subtitle,
//           color: insuranceStatus?.color(context) ?? theme.colors.white,
//         ),
//       ],
//     );
//   }
// }

// class AppCardDetails extends StatelessWidget {
//   final InsuranceStatusType? insuranceStatus;
//   final bool isDark;
//   final String title;
//   final String subtitleDescription;
//   final String? subtitlePrice;

//   const AppCardDetails.action({
//     required this.title, required this.subtitleDescription, super.key,
//     this.isDark = false,
//   })  : insuranceStatus = null,
//         subtitlePrice = null;

//   const AppCardDetails.insurance({
//     required this.insuranceStatus, required this.title, required this.subtitleDescription, super.key,
//     this.subtitlePrice,
//   }) : isDark = false;

//   @override
//   Widget build(BuildContext context) {
//     final theme = DesignSystem.of(context).data2;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppText.title(
//           title,
//           color: theme.colors.black,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             AppText.body(
//               subtitleDescription,
//               color: insuranceStatus != null
//                   ? theme.colors.disabled
//                   : isDark
//                       ? theme.colors.black
//                       : theme.colors.primary,
//             ),
//             subtitlePrice == null
//                 ? const gap.none()
//                 : AppText.body(
//                     subtitlePrice!,
//                     color: theme.colors.disabled,
//                   ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class AppCardStatus extends StatelessWidget {
//   final String description;

//   const AppCardStatus({
//     required this.description, super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = DesignSystem.of(context).data2;
//     return Column(
//       children: [
//         Divider(
//           color: theme.colors.disabled,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: AppText.body(
//             description,
//             color: theme.colors.disabled,
//           ),
//         ),
//       ],
//     );
//   }
// }
