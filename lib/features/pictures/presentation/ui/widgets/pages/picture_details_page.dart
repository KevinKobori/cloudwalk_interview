import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class PictureDetailsPage extends StatefulWidget {
  final String pictureDate;

  const PictureDetailsPage(this.pictureDate, {super.key});

  @override
  State<PictureDetailsPage> createState() => _PictureDetailsPageState();
}

class _PictureDetailsPageState extends State<PictureDetailsPage> {
  final ValueNotifier<PictureViewModel?> rxPictureViewModel =
      ValueNotifier<PictureViewModel?>(null);

  Future<PictureViewModel> getPictureViewModelFromLocalStorage() async {
    final pictureMapList =
        await LocalStorage(localStorageConfigKeyPathFactory())
            .getItem(localLoadPicturesUseCaseFactory().itemKey);

    int pictureMapIndex = pictureMapList
        .indexWhere((pictureMap) => pictureMap['date'] == widget.pictureDate);
    final pictureMap = pictureMapList[pictureMapIndex];

    final pictureViewModel =
        await PicturesMapper().fromMapToViewModel(pictureMap);
    return pictureViewModel;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      rxPictureViewModel.value = await getPictureViewModelFromLocalStorage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: rxPictureViewModel,
        builder: (_, viewModel, __) {
          return ListView(
            children: [
              CachedNetworkImage(
                imageUrl: viewModel!.url,
                placeholder: (_, __) => Container(
                  color: Colors.black,
                  height: 240,
                  width: double.infinity,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  color: Colors.deepOrange,
                  height: 240,
                  width: double.infinity,
                  child: const Icon(Icons.error),
                ),
                fadeOutDuration: const Duration(milliseconds: 1),
                fadeInDuration: const Duration(milliseconds: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      viewModel.date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Secular_One',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      viewModel.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Secular_One',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      viewModel.explanation,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Secular_One',
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
