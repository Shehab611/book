import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.labelText,
      required this.iconData,
      this.obscureText = false,
      this.isLast = false,
      this.enabled = true,
      required this.controller,
      this.validator, this.onFieldSubmitted,
      this.iconColor=kColor,this.labelColor=kColor, this.keyboardType
      });

  final String labelText;
  final IconData iconData;
  final bool obscureText;
  final bool isLast;
  final bool enabled;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final Color iconColor;
  final Color labelColor;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      keyboardType:keyboardType ,
      textInputAction: switch (isLast) {
        true => TextInputAction.done,
        false => TextInputAction.next
      },
      style: GoogleFonts.montserrat(color: kColor),
      controller: controller,
      decoration: InputDecoration(
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        suffixIcon: Icon(
          iconData,
          color: iconColor,
        ),
        focusColor: kColor,
        focusedBorder: const UnderlineInputBorder(),
        labelText: labelText,
        labelStyle:  TextStyle(
            color: labelColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      obscureText: obscureText,
      validator: validator,
      cursorColor: kColor,
      onFieldSubmitted:onFieldSubmitted,
    );
  }
}
