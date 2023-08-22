import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_item.dart';

class SavedItem extends StatelessWidget {
  const SavedItem(
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
    Size screenSize=MediaQuery.of(context).size;
    return Dismissible(
      key: ValueKey<String>(title),
      background: Container(
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.white),
              Text('Remove from saved',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {

        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Remove Confirmation",
                style: GoogleFonts.montserrat(
                    color: kDefaultColor, fontWeight: FontWeight.w800)
                    .copyWith(
                    fontSize:
                    Theme.of(context).textTheme.headlineSmall?.fontSize),
              ),
              content: Text(
                  "Are you sure you want to Remove this saved book?",
                  style: GoogleFonts.montserrat(
                      color: kDefaultColor, fontWeight: FontWeight.w600)
                      .copyWith(
                      fontSize:
                      Theme.of(context).textTheme.bodyMedium?.fontSize)),
              backgroundColor: kColor,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);

                    },
                    child: const Text("Remove",style: TextStyle(color: kDefaultColor),)),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(false),
                  child: const Text("Cancel",style: TextStyle(color: kDefaultColor),),
                ),
              ],
            );
          },
        );
      },
      child: Card(color: kColor.withOpacity(.2),
        elevation: 0,
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
      ),
    );
  }
}
