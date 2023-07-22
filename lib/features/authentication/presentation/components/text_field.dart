import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField(
      {super.key,
      required this.labelText,
      required this.iconData,
      this.obscureText = false,
      this.isLast = false,
      required this.controller,
      this.validator, this.onSaved});

  final String labelText;
  final IconData iconData;
  final bool obscureText;
  final bool isLast;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
