import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTextWidget extends StatelessWidget {
  const HomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverToBoxAdapter(
          child: Text(
            'Recommended for you',
            style: GoogleFonts.montserrat(
                color: kColor, fontWeight: FontWeight.w800)
                .copyWith(
                fontSize: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.fontSize),
          ),
        ));
  }
}
