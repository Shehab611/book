import 'package:flutter/material.dart';

import 'image_item.dart';

class BookInfoItem extends StatelessWidget {
  const BookInfoItem(
      {Key? key,
        required this.imagePath,
        required this.title,
        required this.rating,
        required this.voteAverage,
        required this.genres})
      : super(key: key);
  final String imagePath;
  final String title;
  final num rating;
  final num voteAverage;
  final List<String?> genres;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ImageItem(imagePath: imagePath, width: 100, height: 146),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: SizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  genres.join(','),
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    ]);
  }
}