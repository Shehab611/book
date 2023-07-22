import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/go_in_button.dart';
import '../components/text_field.dart';

class RegisterBodyWidget extends StatefulWidget {
  const RegisterBodyWidget({super.key});
static  TextEditingController emailController=TextEditingController();
static TextEditingController passwordController=TextEditingController();
static TextEditingController confirmPasswordController=TextEditingController();
 static var formKey = GlobalKey<FormState>();
  @override
  State<RegisterBodyWidget> createState() => _RegisterBodyWidgetState();
}

class _RegisterBodyWidgetState extends State<RegisterBodyWidget> {
  @override
  void dispose() {
    super.dispose();
    RegisterBodyWidget.emailController;
    RegisterBodyWidget.passwordController;
    RegisterBodyWidget.confirmPasswordController;
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: RegisterBodyWidget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            text: TextSpan(
                text: 'Create ',
                style: GoogleFonts.montserrat(
                    fontSize: 25, color: kColor,fontWeight: FontWeight.bold),
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
          ),

           MyTextField(
            labelText: 'Password',
            iconData: Icons.lock,
            controller:RegisterBodyWidget.passwordController,
             obscureText: true,
          ),

           MyTextField(
            labelText: 'Confirm Password',
            iconData: Icons.lock,controller: RegisterBodyWidget.confirmPasswordController,
             obscureText: true,isLast: true,
          ),

          GoInButton(
            onPressed: () {

            },
            iconData: Icons.arrow_forward_ios_outlined,
          ),
        ],
      ),
    );
  }
}
