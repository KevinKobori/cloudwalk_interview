import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PicturesView extends StatefulWidget {
  final IPicturesPresenter presenter;

  const PicturesView(this.presenter, {super.key});

  @override
  State<PicturesView> createState() => _PicturesViewState();
}

class _PicturesViewState extends State<PicturesView>
    with
        LoadingStateManager,
        NavigationStateManager,
        RouteAware {
  @override
  void didPopNext() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.presenter.loadData();
    });
    super.didPopNext();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(I18n.strings.pictures)),
      body: Builder(builder: (context) {
        handleLoading(context, widget.presenter.isLoadingStream);
        handleNavigation(context,
            streamView: widget.presenter.navigateToStream);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await widget.presenter.loadData();
        });

        return StreamBuilder<List<PictureViewModel>?>(
          stream: widget.presenter.picturesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ReloadScreen(
                error: '${snapshot.error}',
                reload: widget.presenter.loadData,
              );
            }
            if (snapshot.hasData) {
              return ListenableProvider(
                create: (_) => widget.presenter,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PictureTile(snapshot.data![index]);
                  },
                ),
              );
            }
            return const SizedBox();
          },
        );
      }),
    );
  }
}
