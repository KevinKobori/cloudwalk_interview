import 'package:nasa_apod_app/nasa_apod_app.dart';
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
