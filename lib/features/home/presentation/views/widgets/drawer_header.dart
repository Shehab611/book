import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                          'https://firebasestorage.googleapis.com/v0/b/book-330e2.appspot.com/o/user_image.jpg?alt=media&token=8a8c2c4e-d4f5-4a01-84d5-44bc1698945f',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 850),
                    ),
                  ),
                ),
                Text(
                  'Ali Ahmed Abdelrahmdan',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                          color: kColor, fontWeight: FontWeight.w800)
                      .copyWith(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.fontSize),
                )
              ],
            )));
  }
}
