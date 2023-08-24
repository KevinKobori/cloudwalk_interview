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

    final result = await fromMapToViewModel(pictureMap);
    return result;
  }

  Future<PictureEntity> fromMapToEntity(Map<String, dynamic> pictureMap) async {
    return await PicturesMapper().fromMapToModel(pictureMap).when(
          (pictureModel) async =>
              await PicturesMapper().fromModelToEntity(pictureModel).when(
                    (pictureEntity) => pictureEntity,
                    (infraException) => throw DomainException(
                        infraException.errorType.dataError.domainError),
                  ),
          (infraException) => throw DomainException(
              infraException.errorType.dataError.domainError),
        );
  }

  Future<PictureViewModel> fromMapToViewModel(
      Map<String, dynamic> pictureMap) async {
    final result = PicturesMapper()
        .fromEntityToViewModel(await fromMapToEntity(pictureMap));
    return await result.when(
      (pictureViewModel) => pictureViewModel,
      (infraException) =>
          throw DomainException(infraException.errorType.dataError.domainError),
    );
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
    return ValueListenableBuilder(
      valueListenable: rxPictureViewModel,
      builder: (_, value, __) {
        return Hero(
          tag: 'apod_object',
          child: Container(
            child: CachedNetworkImage(
              imageUrl: value!.url,
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
          ),
        );
      },
    );
  }
}
