import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:flutter/widgets.dart';

class I18n {
  static ITranslation strings = EnUs();

  static void load({required Locale locale}) {
    switch (locale.toString()) {
      case 'en_US':
        strings = EnUs();
        break;
      case 'pt_BR':
        strings = PtBr();
        break;
      default:
        strings = EnUs();
        break;
    }
  }
}
