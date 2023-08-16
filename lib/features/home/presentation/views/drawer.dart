import 'package:book/constants.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/repositories/drawer/drawer_repo_impl.dart';
import 'package:book/features/home/presentation/view_model_manger/drawer_cubit/drawer_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/drawer_header_cubit/drawer_header_cubit.dart';
import 'package:book/features/home/presentation/widgets/drawer_header.dart';
import 'package:book/features/home/presentation/widgets/drawer_items.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          DrawerCubit()..getValue(),
        ),
        BlocProvider(
          create: (context) => DrawerHeaderCubit(serviceLocator.get<DrawerRepoImpl>())..getUserData(),
        ),
      ],
      child: Drawer(
        backgroundColor: kDefaultColor,
        width: width * 0.75,
        child: const Column(
          children: [
            DrawerHeaderWidget(),
            DrawerItems(),

          ],
        ),
      ),
    );
  }
}
