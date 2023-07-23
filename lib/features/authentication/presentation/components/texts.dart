import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.aboveText,
      required this.bottomText,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.aboveTextAlign=TextAlign.left,
      this.bottomTextAlign=TextAlign.left,
        this.aboveTextColor=kColor,
        this.bottomTextColor=kDefaultColor, this.aboveTextFontSize, this.bottomTextFontSize,
      });

  final String aboveText;
  final Color aboveTextColor;
  final Color bottomTextColor;
  final TextAlign aboveTextAlign;
  final TextAlign bottomTextAlign;
  final String bottomText;
  final CrossAxisAlignment crossAxisAlignment;
  final double? aboveTextFontSize;
  final double? bottomTextFontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          aboveText,
          textAlign: aboveTextAlign,
          style:
              GoogleFonts.montserrat(color: aboveTextColor, fontWeight: FontWeight.w800)
                  .copyWith(
                      fontSize:aboveTextFontSize??
                          Theme.of(context).textTheme.headlineMedium?.fontSize
              ),
        ),
        Text(
          bottomText,
          textAlign: bottomTextAlign,
          style: GoogleFonts.montserrat(
                  color: bottomTextColor, fontWeight: FontWeight.bold)
              .copyWith(
                  fontSize:bottomTextFontSize??
                  Theme.of(context).textTheme.titleLarge?.fontSize
          ),
        ),
      ],
    );
  }
}
