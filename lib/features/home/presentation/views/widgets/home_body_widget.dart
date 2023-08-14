import 'package:book/features/home/presentation/views/widgets/all_books_widget.dart';
import 'package:book/features/home/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'recommended_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AllBooksWidget(),
        TextWidget(),
        RecommendedWidget(),
      ],
    );
  }
}
