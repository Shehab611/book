import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/go_in_button.dart';
import '../components/text_field.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({super.key});

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  @override
  void dispose() {
    LoginBodyWidget.emailController;
    LoginBodyWidget.passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Form(
      key: LoginBodyWidget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Image.asset(
              'assets/images/logo.png',
            height: height * .1,
            ),
            MyTextField(
              labelText: 'Email',
              iconData: Icons.email_outlined,
              controller: LoginBodyWidget.emailController,
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
              controller: LoginBodyWidget.passwordController,
              isLast: true,
              obscureText: true,
              onFieldSubmitted: (p0) => LoginBodyWidget.formKey.currentState!.validate(),
              validator: (String? value) {
              switch(value!.isEmpty){
                case true:
                  return 'Password can not be empty';
                case false:
                  return null;
              }
              },
            ),
            Align(
                alignment:
                    Alignment.lerp(Alignment.center, Alignment.centerRight, .9)!,
                child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Forgot password',
                      style: GoogleFonts.libreCaslonText(
                          color: kDefaultColor, fontSize: 17),
                    ))),
            GoInButton(
              onPressed: () {
                if(LoginBodyWidget.formKey.currentState!.validate()){
                  //todo :: navigate to home and login to firebase
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
