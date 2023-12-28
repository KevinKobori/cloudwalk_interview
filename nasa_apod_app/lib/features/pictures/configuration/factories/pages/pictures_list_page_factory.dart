import 'package:nasa_apod_app/nasa_apod_app.dart';

StatefulWidget picturesListPageFactory() => PicturesPage(
      // picturesPresenterFactory()
      // final picturesPresenter = Modular.get<PicturesCubit>();
      picturesPresenter: picturesPresenterFactory(),
    );
