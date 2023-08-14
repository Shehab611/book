import 'package:book/features/home/presentation/views/components/image_item.dart';
import 'package:flutter/material.dart';

class AllBooksWidget extends StatelessWidget {
  const AllBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: 230,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const ImageItem(
                      imagePath:
                      'http://books.google.com/books/content?id=CoK9JnYiaTkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
                      width: 150,
                      height: 220);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemCount: 5),
          ),
        ));
  }
}
