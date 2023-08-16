import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_item.dart';

class BookInfoItem extends StatelessWidget {
  const BookInfoItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.authors})
      : super(key: key);
  final String imagePath;
  final String title;
  final List<dynamic> authors;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ImageItem(imagePath: imagePath, width: 100, height: 146, ),
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
                    style: GoogleFonts.libreCaslonText(
                            color: kColor, fontWeight: FontWeight.w700)
                        .copyWith(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium?.fontSize,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  authors.join(','),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.libreCaslonText(
                          color: kColor.withOpacity(.5),
                          fontWeight: FontWeight.bold)
                      .copyWith(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  ),
                ),
              ]),
        ),
      ),
    ]);
  }
}
