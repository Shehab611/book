import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/go_in_button.dart';
import '../components/text_field.dart';

class RegisterBodyWidget extends StatefulWidget {
  const RegisterBodyWidget({super.key});

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();
  static var formKey = GlobalKey<FormState>();

  @override
  State<RegisterBodyWidget> createState() => _RegisterBodyWidgetState();
}

class _RegisterBodyWidgetState extends State<RegisterBodyWidget> {
  @override
  void dispose() {
    RegisterBodyWidget.emailController;
    RegisterBodyWidget.passwordController;
    RegisterBodyWidget.confirmPasswordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterBodyWidget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Create ',
                  style: GoogleFonts.montserrat(
                      fontSize: 25, color: kColor, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                        text: 'Account ',
                        style: TextStyle(color: kDefaultColor)),
                  ]),
            ),
            MyTextField(
              labelText: 'Email',
              iconData: Icons.email_outlined,
              controller: RegisterBodyWidget.emailController,
              validator: (String? value) {
                switch (value!.isEmpty) {
                  case true:
                    return 'Email can not be empty';
                  case false:
                    bool isEmail = RegExp(
                            r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    return (isEmail)
                        ? null
                        : 'Please Enter a valid Email Address';
                }
              },
            ),
            MyTextField(
              labelText: 'Password',
              iconData: Icons.lock,
              controller: RegisterBodyWidget.passwordController,
              obscureText: true,
              validator: (String? value) {
                switch (value!.isEmpty) {
                  case true:
                    return 'Password Can not be empty';
                  case false:
                    return switch (value.length) {
                      < 8 => 'Password length must be at least 8',
                      >= 8 =>
                        (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{8,}$')
                                .hasMatch(value))
                            ? null
                            : 'Password must contain upper case& lower case & special char & number',
                      _ => ''
                    };
                }
              },
            ),
            MyTextField(
              labelText: 'Confirm Password',
              iconData: Icons.lock,
              controller: RegisterBodyWidget.confirmPasswordController,
              obscureText: true,
              isLast: true,
              validator: (String? value) {
                switch (value!.isEmpty) {
                  case true:
                    return 'Confirm Password Can not be empty';
                  case false:
                    return value.compareTo(
                                RegisterBodyWidget.passwordController.text) !=
                            0
                        ? 'Passwords are not equivalent'
                        : null;
                }
              },
              onFieldSubmitted: (p0) => RegisterBodyWidget.formKey.currentState!.validate(),
            ),
            GoInButton(
              onPressed: () {
                if(RegisterBodyWidget.formKey.currentState!.validate()){
                  //todo :: navigate to complete_profile.dart and create account in firebase
                }
              },
              iconData: Icons.arrow_forward_ios_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
