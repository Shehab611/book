import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.aboveText, required this.bottomText});

  final String aboveText;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboveText,
          style: GoogleFonts.montserrat(
                  color: kColor, fontWeight: FontWeight.w800)
              .copyWith(
                  fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize),
        ),
        Text(
          bottomText,
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
              color: kDefaultColor, fontWeight: FontWeight.bold).copyWith(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize),
        ),
      ],
    );
  }
}
