import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key? key,
      required this.imagePath,
       this.width,
        this.boxFit,
       this.height})
      : super(key: key);
  final String imagePath;
  final double? width, height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        width: width,
        height: height,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        fit: boxFit??BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 850),
        errorWidget: (context, url, error) =>const Placeholder() ,
      ),
    );

  }
}
