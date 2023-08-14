import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key? key,
        required this.imagePath,
        required this.width,
        required this.height})
      : super(key: key);
  final String imagePath;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          )),
    );
  }
}