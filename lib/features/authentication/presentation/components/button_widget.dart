import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.iconData,
      required this.buttonText,
        this.iconColor=kColor,
        this.textColor=kColor,
        this.buttonBackgroundColor=kDefaultColor,
        this.iconDirection=TextDirection.ltr
      });

  final void Function() onPressed;
  final IconData iconData;
  final String buttonText;
  final Color iconColor;
  final Color textColor;
  final Color buttonBackgroundColor;
  final TextDirection iconDirection;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:iconDirection,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        label: Text(
          buttonText,
          style: GoogleFonts.libreCaslonText(color: textColor, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
      ),
    );
  }
}
