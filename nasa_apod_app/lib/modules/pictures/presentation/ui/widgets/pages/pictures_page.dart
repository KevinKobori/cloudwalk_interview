import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:provider/provider.dart';

class PicturesPage extends StatefulWidget {
  final IPicturesPresenter picturesPresenter;

  const PicturesPage(this.picturesPresenter, {super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage>
    with LoadingStateManager, NavigationStateManager, RouteAware {
  @override
  void didPopNext() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.picturesPresenter.loadPictures();
    });
    super.didPopNext();
  }

  @override
  void dispose() {
    widget.picturesPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      handleLoading(context, widget.picturesPresenter.isLoadingStream);
      handleNavigation(context,
          streamView: widget.picturesPresenter.navigateToStream);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await widget.picturesPresenter.loadPictures();
      });
      return StreamBuilder<List<PictureViewModel>?>(
        stream: widget.picturesPresenter.picturesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ReloadScreen(
              error: '${snapshot.error}',
              reload: widget.picturesPresenter.loadPictures,
            );
          }
          if (snapshot.hasData) {
            return ListenableProvider(
              create: (_) => widget.picturesPresenter,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PictureTile(
                    picturesPresenter: widget.picturesPresenter,
                    pictureViewModel: snapshot.data![index],
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      );
      //   return ScreenTypeLayout.builder(
      //     mobile: (_) => PicturesPageMobile(
      //       picturesPresenter: widget.picturesPresenter,
      //     ),
      //     tablet: (_) => PicturesPageMobile(
      //       picturesPresenter: widget.picturesPresenter,
      //     ),
      //     desktop: (_) => PicturesPageMobile(
      //       picturesPresenter: widget.picturesPresenter,
      //     ),
      //   );
    });
  }
}
