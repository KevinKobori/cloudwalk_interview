import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

class PictureTile extends StatelessWidget {
  final PictureViewModel pictureViewModel;
  final IPicturesPresenter picturesPresenter;

  const PictureTile({
    super.key,
    required this.pictureViewModel,
    required this.picturesPresenter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => picturesPresenter.goToPictureDetails(pictureViewModel.date,
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
              offset: const Offset(0, 0),
              spreadRadius: 5,
              blurRadius: 10,
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
                  const SizedBox(height: 16),
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
