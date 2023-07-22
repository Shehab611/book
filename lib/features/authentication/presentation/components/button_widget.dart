import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.iconData,
      required this.buttonText});

  final void Function() onPressed;
  final IconData iconData;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: kColor,
      ),
      label: Text(
        buttonText,
        style: GoogleFonts.libreCaslonText(color: kColor, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kDefaultColor,
      ),
    );
  }
}
