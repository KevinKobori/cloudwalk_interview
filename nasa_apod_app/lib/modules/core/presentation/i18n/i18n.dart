import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'strings/en_us.dart';
export 'strings/pt_br.dart';
export 'strings/translation.dart';

class I18n {
  static Translation strings = EnUs();

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
