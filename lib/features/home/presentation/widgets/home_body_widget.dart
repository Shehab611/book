import 'package:book/features/home/presentation/widgets/all_books_widget.dart';
import 'package:book/features/home/presentation/widgets/home_text_widget.dart';
import 'package:flutter/material.dart';

import 'recommended_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AllBooksWidget(),
        HomeTextWidget(),
        RecommendedWidget(),
      ],
    );
  }
}
