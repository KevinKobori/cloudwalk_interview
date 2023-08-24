import 'dart:ui';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

class ApodDialogBody extends StatelessWidget {
  const ApodDialogBody({super.key, this.header, required this.child});

  final Widget? header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(0.3),
          child: ApodScrollView(
            header: header,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            body: child,
          ),
        ),
      ),
    );
  }
}
