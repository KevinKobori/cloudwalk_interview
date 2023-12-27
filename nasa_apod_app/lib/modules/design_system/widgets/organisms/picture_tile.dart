import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureTile extends StatelessWidget {
  final PictureViewModel pictureViewModel;
  final PicturesPresenter picturesPresenter;

  const PictureTile({
    required this.pictureViewModel,
    required this.picturesPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => picturesPresenter.pushToPictureDetails(pictureViewModel.date,
          pictureViewModel: pictureViewModel),
      child: Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(pictureViewModel.url),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              spreadRadius: 4,
              blurRadius: 8,
              color: Colors.grey.shade700,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0, 0.1, 0.6],
                    colors: [
                      Colors.black,
                      Colors.black87,
                      Colors.transparent,
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppGaps.medium,
                  Text(
                    pictureViewModel.date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Secular_One',
                    ),
                  ),
                  Text(
                    pictureViewModel.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Secular_One',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
