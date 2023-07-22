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
      this.validator, this.onSaved});

  final String labelText;
  final IconData iconData;
  final bool obscureText;
  final bool isLast;
  final bool enabled;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      textInputAction: switch (isLast) {
        true => TextInputAction.done,
        false => TextInputAction.next
      },
      style: GoogleFonts.montserrat(color: kColor),
      controller: controller,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: Icon(
          iconData,
          color: kColor,
        ),
        focusColor: kColor,
        focusedBorder: const UnderlineInputBorder(),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: kColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      obscureText: obscureText,
      validator: validator,
      cursorColor: kColor,
      onSaved:onSaved,
    );
  }
}
