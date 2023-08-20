import 'package:book/features/home/presentation/components/image_item.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
       children: [
         Center(
           child: ImageItem(
             height: 270,
             width: 200,
             imagePath:'http://books.google.com/books/content?id=GsPDEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api' ,
           ),
         )
       ],
      ),
    );
  }
}
