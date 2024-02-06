import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class ColorsUtils {
  static Color background = Colors.black;
}

class PicturesPage extends StatefulWidget {
  final PicturesPresenter picturesPresenter;
  const PicturesPage({
    required this.picturesPresenter,
    super.key,
  });

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  @override
  void initState() {
    widget.picturesPresenter.loadPictures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor:
              //  Colors.transparent
              theme.colorScheme.background.withOpacity(0),
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            // backgroundColor: theme.colorScheme.background.withOpacity(0.6),
            // Colors.transparent,
            // backgroundColor: ColorsUtils.background,
            title: SizedBox(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OutlinedButton(
                    onPressed: widget.picturesPresenter.loadPictures,
                    child: const Text('List all'),
                  ),
                  ApodGaps.medium,
                  ApodDatePickerDialog(widget.picturesPresenter),
                ],
              ),
            ),
          ),
          body: Center(
            child: BlocBuilder<PicturesCubit, PicturesState>(
              bloc: widget.picturesPresenter as PicturesCubit,
              builder: (context, state) {
                if (state is PicturesLoading) {
                  return const PicturesPageLoadingView();
                } else if (state is PicturesError) {
                  return ApodReloadPage(
                    error: state.message,
                    reload: widget.picturesPresenter.loadPictures,
                  );
                } else if (state is PicturesLoaded) {
                  return ListView.builder(
                    itemCount: state.pictureViewModelList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return AppPadding(
                        padding: ApodEdgeInsets.allLarge,
                        // Theme.of(context).data.spacings.large.toInsets(),
                        child: ApodPicturesListTile(
                          picturesPresenter: widget.picturesPresenter,
                          pictureViewModel: state.pictureViewModelList![index],
                        ),
                      );
                      // return Icon(Theme.of(context).data.)
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        );
      }
    );
  }
}

class PicturesPageLoadingView extends StatelessWidget {
  const PicturesPageLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
