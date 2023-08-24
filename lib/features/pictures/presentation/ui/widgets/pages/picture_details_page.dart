import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PictureDetailsPage extends StatelessWidget {
  final String imageURL;
  const PictureDetailsPage(
    this.imageURL, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
