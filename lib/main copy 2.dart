import 'package:alice/alice.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => const PicturesListPage());
    r.child('/details',
        child: (_) => PictureDetailsPage(imageURL: r.args.data));
  }
}

class AppWidget extends StatelessWidget {
  final alice = Alice();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.routerDelegate.setNavigatorKey(alice.getNavigatorKey());
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cache Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}

class PicturesListPage extends StatelessWidget {
  const PicturesListPage({Key? key}) : super(key: key);

  @override
  Widget build(_) {
    return ListView.builder(
      itemBuilder: (_, index) => Card(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: urlList[index],
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
          ],
        ),
      ),
      itemCount: urlList.length,
    );
  }
}

class PictureDetailsPage extends StatelessWidget {
  final String imageURL;
  const PictureDetailsPage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(_) {
    return CachedNetworkImage(
      imageUrl: imageURL,
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
    );
  }
}

final hdurlList = [
  'https://apod.nasa.gov/apod/image/2308/Perseids18_Horalek_1494.jpg',
  'https://apod.nasa.gov/apod/image/2308/PIA25969_Ingenuity.jpg',
  'https://apod.nasa.gov/apod/image/2308/M51_255hours.jpg',
  'https://apod.nasa.gov/apod/image/2308/Ghirigori_delBooteCoronaBorealeOfiucoeChiomadiBerenice.jpg',
  'https://apod.nasa.gov/apod/image/2308/sombrero_spitzer_3000.jpg',
  'https://apod.nasa.gov/apod/image/2308/M57_JwstKong_4532.jpg',
  'https://apod.nasa.gov/apod/image/2308/TripleIceland_Zarzycka_6501.jpg',
  'https://apod.nasa.gov/apod/image/2308/NGC-7284-7285-LRGB-crop-CDK-1000-7-August-2023.jpg',
  'https://apod.nasa.gov/apod/image/2308/ElephantTrunkBatSquidSeahorse.jpg',
  'https://apod.nasa.gov/apod/image/2308/nh-northpolerotatedcontrast.jpg',
];

final urlList = [
  'https://apod.nasa.gov/apod/image/2308/Perseids18_Horalek_960.jpg',
  'https://apod.nasa.gov/apod/image/2308/PIA25969_Ingenuity1024.jpg',
  'https://apod.nasa.gov/apod/image/2308/M51_255hours_1024.jpg',
  'https://apod.nasa.gov/apod/image/2308/Ghirigori_delBooteCoronaBorealeOfiucoeChiomadiBerenice1024.jpg',
  'https://apod.nasa.gov/apod/image/2308/sombrero_spitzer_1080.jpg',
  'https://apod.nasa.gov/apod/image/2308/M57_JwstKong_960.jpg',
  'https://apod.nasa.gov/apod/image/2308/TripleIceland_Zarzycka_1080.jpg',
  'https://apod.nasa.gov/apod/image/2308/NGC-7284-7285-LRGB-crop-CDK-1000-7-August-2023x1024.jpg',
  'https://apod.nasa.gov/apod/image/2308/ElephantTrunkBatSquidSeahorse1024.jpg',
  'https://apod.nasa.gov/apod/image/2308/nh-northpolerotatedcontrast1024.jpg',
];
