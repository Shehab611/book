import 'package:book/features/authentication/presentation/components/texts.dart';
import 'package:flutter/material.dart';

import 'image_item.dart';

class SavedItem extends StatelessWidget {
  const SavedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 275,
      child: Column(
        children: [
          const ImageItem(
              imagePath:
              'http://books.google.com/books/content?id=GsPDEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
              width: 150,
              height: 212),
          TextWidget(
            aboveText: 'Book Name feijgrijirirjihji',
            aboveTextFontSize:Theme.of(context).textTheme.titleMedium?.fontSize,
            bottomTextFontSize:Theme.of(context).textTheme.labelLarge?.fontSize,
            aboveTextAlign: TextAlign.center,
            bottomTextAlign: TextAlign.center,
            bottomText: 'ahgrstwjrjrsrfubouwaygbyreeeeeh5erju',
            aboveTextMaxLines: 1,
            bottomTextMaxLines: 2,
          )
        ],
      ),
    );
  }
}
