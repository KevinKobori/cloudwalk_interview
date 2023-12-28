import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

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
                onPressed: widget.picturesPresenter.loadPictures,
                child: const Text('List all'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<PicturesCubit, PicturesState>(
          bloc: widget.picturesPresenter as PicturesCubit,
          builder: (context, state) {
            if (state is PicturesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PicturesError) {
              return ReloadScreen(
                error: state.message,
                reload: widget.picturesPresenter.loadPictures,
              );
            } else if (state is PicturesLoaded) {
              return ListView.builder(
                itemCount: state.pictureViewModelList?.length ?? 0,
                itemBuilder: (context, index) {
                  return PictureTile(
                    picturesPresenter: widget.picturesPresenter,
                    pictureViewModel: state.pictureViewModelList![index],
                  );
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
}
