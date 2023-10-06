import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin StreamUIErrorStateManager {
  void handleMainError(
      BuildContext context, Stream<DomainErrorType?> stream) {
    stream.listen((error) {
      if (error != null) {
        showErrorMessage(context, error.i18nError);
      }
    });
  }
}
