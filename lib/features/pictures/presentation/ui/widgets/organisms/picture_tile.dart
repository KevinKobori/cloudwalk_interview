import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/material.dart';

class PictureTile extends StatelessWidget {
  final PictureViewModel viewModel;
  final IPicturesPresenter picturesPresenter;

  const PictureTile({
    super.key,
    required this.viewModel,
    required this.picturesPresenter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => picturesPresenter.goToPictureDetails(viewModel.date),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                  blurRadius: 2,
                  color: Colors.black,
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: viewModel.url,
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
              Text(
                viewModel.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                viewModel.date,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
