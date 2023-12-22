import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPage extends StatefulWidget {
  const PicturesPage({super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PicturesCubit(
          loadLastTenDaysPicturesByDate:
              remoteLoadPicturesUseCaseWithLocalFallbackFactory())
        ..fetchPictures(),
      child: BlocBuilder<PicturesCubit, PicturesState>(
        builder: (context, state) {
          if (state is PicturesError) {
            return ReloadScreen(
              error: state.message,
              reload: () async {},
              //  widget.picturesPresenter.loadPictures,
            );
            // const Center(child: Text('ERROR'));
          } else if (state is PicturesLoading) {
            return const CircularProgressIndicator();
          } else if (state is PicturesLoaded) {
            return ListView.builder(
              itemCount: state.pictureViewModelList?.length ?? 0,
              itemBuilder: (context, index) {
                return PictureTile(
                  // picturesPresenter: widget.picturesPresenter,
                  pictureViewModel: state.pictureViewModelList![index],
                );
              },
            );
          } else if (state is PicturesError) {
            return Text('Error: ${state.message}');
          }
          return Container(); // Idle state
        },
      ),
    );
  }
}
