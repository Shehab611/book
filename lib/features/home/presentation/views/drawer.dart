import 'package:book/constants.dart';
import 'package:book/features/home/presentation/widgets/drawer_header.dart';
import 'package:book/features/home/presentation/widgets/drawer_items.dart';

import 'package:flutter/material.dart';



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
