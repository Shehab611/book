import 'package:book/constants.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/presentation/components/button_widget.dart';
import 'package:book/features/authentication/presentation/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../components/text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static TextEditingController emailController = TextEditingController();
  static bool isVisible = false;
  static var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height *.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/animated_json/reset_password_animation.json',
                      height: size.height * .3,
                    ),
                  ),
                  const TextWidget(
                      aboveText: 'Forgot\nPassword?',
                      bottomTextColor: kColor,
                      aboveTextColor: kDefaultColor,
                      bottomTextFontSize: 15,
                      bottomText:
                      'Don\'t worry! it happens. Please enter the email address associated with your account'),
                  MyTextField(
                      labelText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      labelColor: kDefaultColor,
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
                      iconData: Icons.alternate_email,
                      controller: emailController),
                  Center(
                    child: ButtonWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // todo :: send reset password email
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Password Reset",
                                  style: GoogleFonts.montserrat(
                                      color: kDefaultColor,
                                      fontWeight: FontWeight.w800)
                                      .copyWith(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.fontSize),
                                ),
                                content: Text(
                                    "Your Reset Password mail has been sent to your email.\nPlease for the instructions provided in this mail.",
                                    style: GoogleFonts.montserrat(
                                        color: kDefaultColor,
                                        fontWeight: FontWeight.w600)
                                        .copyWith(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontSize)),
                                backgroundColor: kColor,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 10,
                                actions: [
                                  Center(
                                    child: ButtonWidget(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, AppRouter.kLoginScreen);
                                      },
                                      iconData: Icons.check_circle_rounded,
                                      buttonText: 'Go to Login Page',
                                      iconDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      iconData: FontAwesomeIcons.paperPlane,
                      buttonText: 'SUBMIT',
                      iconDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
