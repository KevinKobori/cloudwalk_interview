import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesModule extends Module {
  PicturesModule();

  @override
  void binds(i) {
    i.add<PicturesPageCubit>(() => picturesPresenterFactory());
  }

  @override
  void routes(r) {
    r.child('/',
        child: (_) => PicturesPage(
            picturesPagePresenter: Modular.get<PicturesPageCubit>()));

    r.child('/:pictureDate',
        child: (context) => PictureDetailsPage(r.args.params['pictureDate']!,
            pictureViewModel: r.args.data));
  }
}
