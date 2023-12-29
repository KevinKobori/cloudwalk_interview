import 'package:fluttely_core/fluttely_core.dart';

mixin KeyboardManager {
  void hideKeyboard(BuildContext context) {
    final currectFocus = FocusScope.of(context);
    if (!currectFocus.hasPrimaryFocus) {
      currectFocus.unfocus();
    }
  }
}
