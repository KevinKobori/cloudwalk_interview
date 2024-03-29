import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesModule extends Module {
  PicturesModule();

  @override
  void binds(i) {
    i.addSingleton<PicturesCubit>(() => picturesPresenterFactory());
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => picturesListPageFactory());
    r.child('/:pictureDate',
        child: (context) => pictureDetailsFactory(r.args.params['pictureDate']!,
            pictureViewModel: r.args.data));
  }
}
