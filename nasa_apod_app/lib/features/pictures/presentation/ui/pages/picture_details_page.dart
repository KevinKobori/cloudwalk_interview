import 'package:cached_network_image/cached_network_image.dart' as cni;
import 'package:dartz/dartz.dart' as dz;
import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureDetailsPage extends StatefulWidget {
  final String pictureDate;
  final PictureViewModel? pictureViewModel;

  const PictureDetailsPage(
    this.pictureDate, {
    required this.pictureViewModel,
    super.key,
  });

  @override
  State<PictureDetailsPage> createState() => _PictureDetailsPageState();
}

class _PictureDetailsPageState extends State<PictureDetailsPage> {
  final ValueNotifier<PictureViewModel?> rxPictureViewModel =
      ValueNotifier<PictureViewModel?>(null);

  Future<dz.Either<DomainFailure, PictureViewModel>>
      getPictureViewModelFromLocalStorage() async {
    final pictureJsonList =
        await ls.LocalStorage(localStorageConfigKeyPathFactory())
            .getItem(localLoadPicturesUseCaseFactory().itemKey);

    final int pictureMapIndex = pictureJsonList.indexWhere(
        (dynamic pictureJson) => pictureJson['date'] == widget.pictureDate);
    final pictureJson = pictureJsonList[pictureMapIndex];

    final viewModelResult = PictureMapper.fromJsonToViewModel(pictureJson);
    return viewModelResult.fold((l) {
      return dz.Left(l.fromJsonperToDomain);
    }, (r) {
      return dz.Right(r);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // if (widget.pictureViewModel == null) {
      final result = await getPictureViewModelFromLocalStorage();
      result.fold(
        (domainFailure) {},
        (pictureViewModel) {
          rxPictureViewModel.value = pictureViewModel;
        },
      );
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          onPressed: () {
            NavigatorManager.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: rxPictureViewModel,
        builder: (_, pictureViewModel, __) {
          final picture = widget.pictureViewModel ?? pictureViewModel;
          return ListView(
            children: [
              cni.CachedNetworkImage(
                imageUrl: picture!.url,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ApodGaps.medium,
                    Text(
                      picture.date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Secular_One',
                      ),
                    ),
                    ApodGaps.small,
                    Text(
                      picture.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Secular_One',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ApodGaps.large,
                    Text(
                      picture.explanation,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Secular_One',
                          fontWeight: FontWeight.w400),
                    ),
                    ApodGaps.extraLarge,
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
