import 'package:book/features/home/presentation/views/components/book_info.dart';
import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const BookInfoItem(
              imagePath:
              'http://books.google.com/books/content?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72Sr1FckXSy-4MUeiR_OJPqBfLy3rS5MUiBZXECVIElqdg14RQd9W1wfsD57GB3RdJ-sBAayjMwPZoFJbfGInfsdDxHTBrSpUJTWNfRONdPa20pGBAZ-GJZ-nRpZ8XOwrgCYmVl&source=gbs_api',
              title: 'Mexico',
              authors: ['Tourism'],
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.8,
          ),
          itemCount: 40,
        ),
      ),
    );
  }
}
