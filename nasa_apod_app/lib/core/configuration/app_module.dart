import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: PicturesModule());
  }
}
