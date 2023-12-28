import 'package:cached_network_image/cached_network_image.dart' as cni;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureDetailsPage extends StatefulWidget {
  final String pictureDate;
  final PictureViewModel pictureViewModel;

  const PictureDetailsPage(
    this.pictureDate, {
    required this.pictureViewModel,
    super.key,
  });

  @override
  State<PictureDetailsPage> createState() => _PictureDetailsPageState();
}

class _PictureDetailsPageState extends State<PictureDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          cni.CachedNetworkImage(
            imageUrl: widget.pictureViewModel.url,
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
                  widget.pictureViewModel.date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Secular_One',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.pictureViewModel.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Secular_One',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.pictureViewModel.explanation,
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
      ),
    );
  }
}
