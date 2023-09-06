import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_item.dart';

class SavedItem extends StatelessWidget {
  const SavedItem(
      {Key? key,
        required this.imagePath,
        required this.title,
        required this.authors,})
      : super(key: key);
  final String imagePath;
  final String title;
  final List<dynamic> authors;

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Card(
      color: kDefaultColor.withOpacity(.7),
      elevation: 2,
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: 4),
        leading: ImageItem(imagePath: imagePath, width: screenSize.width * .15,boxFit: BoxFit.fill, ),
        title:Text(
          title,
          style: GoogleFonts.libreCaslonText(
              color: kColor, fontWeight: FontWeight.w700)
              .copyWith(
            fontSize:
            Theme.of(context).textTheme.headlineSmall?.fontSize,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ) ,
        subtitle:   Text(
          authors.join(' , '),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.libreCaslonText(
              color: kColor.withOpacity(.5),
              fontWeight: FontWeight.bold)
              .copyWith(
            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
          ),
        ),
      ),
    );
  }


}
