import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

mixin StreamUIErrorStateManager {
  void handleMainError(
      BuildContext context, Stream<PresenterErrorType?> stream) {
    stream.listen((error) {
      if (error != null) {
        showErrorMessage(context, error.i18nError);
      }
    });
  }
}
