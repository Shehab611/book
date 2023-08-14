import 'package:book/constants.dart';
import 'package:book/features/home/presentation/views/widgets/drawer_header.dart';
import 'package:flutter/material.dart';

import 'widgets/drawer_items.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Drawer(
      backgroundColor: kDefaultColor,
      width: width * 0.75,
      child: const Column(
        children: [
          DrawerHeaderWidget(),

          DrawerItems(),
        ],
      ),
    );
  }
}
