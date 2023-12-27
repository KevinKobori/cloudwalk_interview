import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPage extends StatefulWidget {
  const PicturesPage({super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  final picturesPresenter = Modular.get<PicturesCubit>();

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
                onPressed: picturesPresenter.loadPictures,
                child: const Text('List all'),
              ),
              AppGaps.medium,
              DatePickerComponent(picturesPresenter),
            ],
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<PicturesCubit, PicturesState>(
          bloc: picturesPresenter..loadPictures(),
          builder: (context, state) {
            if (state is PicturesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PicturesError) {
              return ReloadScreen(
                error: state.message,
                reload: picturesPresenter.loadPictures,
              );
            } else if (state is PicturesLoaded) {
              return ListView.builder(
                itemCount: state.pictureViewModelList?.length ?? 0,
                itemBuilder: (context, index) {
                  return PictureTile(
                    picturesPresenter: picturesPresenter,
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
