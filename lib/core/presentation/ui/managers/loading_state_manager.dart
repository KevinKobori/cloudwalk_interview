import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

mixin LoadingStateManager {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((isLoading) async {
      if (isLoading == true) {
        await showLoadingDialog(context: context, description: '');
      } else {
        hideLoading(context);
      }
    });
  }
}
