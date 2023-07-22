import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/go_in_button.dart';
import '../components/text_field.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({super.key});
  static  TextEditingController emailController=TextEditingController();
  static TextEditingController passwordController=TextEditingController();

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  @override
  void dispose() {
    super.dispose();
    LoginBodyWidget.emailController;
    LoginBodyWidget.passwordController;

  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/logo.png',
          height: height * .28,
        ),
         AuthenticationTextField(
          labelText: 'Email',
          iconData: Icons.email_outlined,controller: LoginBodyWidget.emailController,
        ),

         AuthenticationTextField(
          labelText: 'Password',
          iconData: Icons.lock,controller: LoginBodyWidget.passwordController,isLast: true,obscureText: true,
        ),

        Align(
            alignment:
                Alignment.lerp(Alignment.center, Alignment.centerRight, .9)!,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password',
                  style: GoogleFonts.libreCaslonText(
                      color: kDefaultColor, fontSize: 17),
                ))),
        GoInButton(
          onPressed: () {},
          iconData: Icons.arrow_forward_ios_outlined,
        ),
      ],
    );
  }
}
