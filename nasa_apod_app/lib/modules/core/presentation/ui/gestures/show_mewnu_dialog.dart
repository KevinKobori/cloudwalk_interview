import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

Future<void> showMewnuDialog({
  required BuildContext context,
  required Widget child,
  Widget? header,
}) async {
  SchedulerBinding.instance.addPostFrameCallback((_) async {
    await showDialog<Widget>(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        backgroundColor: Colors.transparent,
        insetPadding: AppPaddings.staticScreen,
        elevation: 0,
        contentPadding: EdgeInsets.zero,
        children: <Widget>[
          ApodDialogBody(
            header: header,
            child: child,
          ),
        ],
      ),
    );
  });
}
