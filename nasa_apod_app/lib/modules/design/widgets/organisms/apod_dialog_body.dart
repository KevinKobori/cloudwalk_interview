import 'dart:ui';

import 'package:nasa_apod_app/nasa_apod_app.dart';

class ApodDialogBody extends StatelessWidget {
  const ApodDialogBody({required this.child, super.key, this.header});

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
