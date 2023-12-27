import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class ApodScrollView extends StatelessWidget {
  const ApodScrollView(
      {required this.body,
      super.key,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.header});

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
          AppGaps.large,
          SizedBox(
            height: 48,
            child: Center(child: header ?? const SizedBox()),
          ),
          Padding(
            padding: AppPaddings.scrolledScreen,
            child: body,
          ),
          AppGaps.extraLarge,
        ],
      ),
    );
  }
}
