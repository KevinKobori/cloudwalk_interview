import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

export 'configuration/configuration.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class PicturesModule extends Module {
  PicturesModule();

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => picturesListPageFactory());
    r.child('/:pictureDate',
        child: (context) => pictureDetailsFactory(r.args.params['pictureDate']!,
            pictureViewModel: r.args.data));
  }
}
