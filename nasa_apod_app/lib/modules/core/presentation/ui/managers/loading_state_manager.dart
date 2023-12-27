import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin LoadingStateManager {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen(
      (isLoading) async {
        if (isLoading == true) {
          await showLoadingDialog(context: context, description: '');
        } else {
          hideLoading(context);
        }
      },
    );
  }
}
