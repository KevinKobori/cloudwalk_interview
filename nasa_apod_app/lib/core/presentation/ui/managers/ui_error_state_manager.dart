import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin StreamUIFailureStateManager {
  void handleMainFailure(
      BuildContext context, Stream<DomainFailureType?> stream) {
    stream.listen((error) {
      if (error != null) {
        showFailureMessage(context, error.i18nFailure);
      }
    });
  }
}
