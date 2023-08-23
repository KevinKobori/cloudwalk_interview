import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

class ApodScrollView extends StatelessWidget {
  const ApodScrollView(
      {super.key,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.header,
      required this.body});

  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Widget? header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UIBlancBox.verticalSpaceLarge,
          SizedBox(
            height: 48,
            child: Center(child: header ?? const SizedBox()),
          ),
          Padding(
            padding: UIPaddings.scrolledScreen,
            child: body,
          ),
          UIBlancBox.verticalSpaceExtraLarge,
        ],
      ),
    );
  }
}
