import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PicturesListPage extends StatefulWidget {
  final IPicturesPresenter picturesPresenter;

  const PicturesListPage(this.picturesPresenter, {super.key});

  @override
  State<PicturesListPage> createState() => _PicturesListPageState();
}

class _PicturesListPageState extends State<PicturesListPage>
    with LoadingStateManager, NavigationStateManager, RouteAware {
  @override
  void didPopNext() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.picturesPresenter.loadData();
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DatePickerComponent(widget.picturesPresenter),
      body: Builder(builder: (context) {
        handleLoading(context, widget.picturesPresenter.isLoadingStream);
        handleNavigation(context,
            streamView: widget.picturesPresenter.navigateToStream);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await widget.picturesPresenter.loadData();
        });

        return ValueListenableBuilder(
            valueListenable: widget.picturesPresenter.pictureFound,
            builder: (_, value, __) {
              if (value != null) {
                return PictureTile(
                  picturesPresenter: widget.picturesPresenter,
                  viewModel: value,
                );
              }

              return StreamBuilder<List<PictureViewModel>?>(
                stream: widget.picturesPresenter.picturesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ReloadScreen(
                      error: '${snapshot.error}',
                      reload: widget.picturesPresenter.loadData,
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
                            viewModel: snapshot.data![index],
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              );
            });
      }),
    );
  }
}
