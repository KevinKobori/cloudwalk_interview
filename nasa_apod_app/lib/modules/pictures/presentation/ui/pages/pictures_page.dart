import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPage extends StatefulWidget {
  final PicturesPresenter picturesPresenter;

  const PicturesPage(this.picturesPresenter, {super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage>
    with LoadingStateManager, NavigationStateManager, RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.picturesPresenter.loadPictures();
    });
    super.initState();
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
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                OutlinedButton(
                  onPressed: () {
                    widget.picturesPresenter.loadPictures();
                  },
                  child: const Text('List all'),
                ),
                const SizedBox(width: 16),
                DatePickerComponent(widget.picturesPresenter),
              ],
            ),
          ),
        ),
        body: StreamBuilder<List<PictureViewModel>?>(
          stream: widget.picturesPresenter.picturesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ReloadScreen(
                error: '${snapshot.error}',
                reload: widget.picturesPresenter.loadPictures,
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PictureTile(
                    picturesPresenter: widget.picturesPresenter,
                    pictureViewModel: snapshot.data![index],
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      );
    });
  }
}