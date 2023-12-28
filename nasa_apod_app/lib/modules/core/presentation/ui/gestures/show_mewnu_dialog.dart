import 'package:flutter/scheduler.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

Future<void> showMewnuDialog({
  required BuildContext context,
  required Widget child,
  Widget? header,
}) async {
  SchedulerBinding.instance.addPostFrameCallback((_) async {
    final theme = Theme.of(context);
    await showDialog<Widget>(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        backgroundColor: Colors.transparent,
        insetPadding: AppEdgeInsetsSizes.staticScreen.toEdgeInsets(theme.data),
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
