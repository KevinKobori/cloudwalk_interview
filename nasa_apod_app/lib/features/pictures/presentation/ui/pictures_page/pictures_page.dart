import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPage extends StatefulWidget {
  final PicturesPagePresenter picturesPagePresenter;
  const PicturesPage({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  @override
  void initState() {
    widget.picturesPagePresenter.loadPictures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesPageCubit, PicturesPageState>(
      bloc: widget.picturesPagePresenter as PicturesPageCubit,
      builder: (context, state) {
        if (state is PicturesPageStateLoading) {
          return PicturesPageStateLoadingView(
            picturesPagePresenter: widget.picturesPagePresenter,
          );
        } else if (state is PicturesPageStateLoadFailure) {
          return PicturesPageStateLoadFailureView(
            failureMessage: state.failureMessage,
            reload: widget.picturesPagePresenter.loadPictures,
          );
        } else if (state is PicturesPageStateLoadSuccess) {
          return PicturesPageStateLoadSuccessView(
            picturesPagePresenter: widget.picturesPagePresenter,
            pictureViewModelList: state.pictureViewModelList,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
