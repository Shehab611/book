import 'package:book/constants.dart';
import 'package:book/features/home/presentation/view_model_manger/drawer_header_cubit/drawer_header_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerHeaderCubit, DrawerHeaderState>(
  builder: (context, state) {
    return AnimatedCrossFade(
      firstChild: const SizedBox(),
      secondChild: Center(
          child: DrawerHeader(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl:
                (state is DrawerHeaderGetUserData)?state.userData.userImagePath:'',
                placeholder: (context, url) => const CircularProgressIndicator(),
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 850),
              ),
            ),
          ),
          Text(
            (state is DrawerHeaderGetUserData)?state.userData.userName:'',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
                    color: kColor, fontWeight: FontWeight.w800)
                .copyWith(
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize),
          )
        ],
      ))),
      crossFadeState: (state is DrawerHeaderGetUserData)?CrossFadeState.showSecond:CrossFadeState.showFirst,
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
  },
);
  }
}
