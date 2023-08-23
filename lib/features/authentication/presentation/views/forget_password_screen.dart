import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/components/button_widget.dart';
import 'package:book/features/authentication/presentation/components/texts.dart';
import 'package:book/features/authentication/presentation/view_model_manger/reset_password_cubit/reset_password_cubit.dart';
import 'package:book/core/utils/components/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../components/text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Form(
        key: ResetPasswordCubit.get(context).formKey,
        child: BlocConsumer<ResetPasswordCubit,ResetPasswordState>(
          listener: (context, state) {
            if (state is SendResetPassword) {
              if (!state.data.succsuful) {
                ScaffoldMessenger.of(context).showSnackBar(
                  MySnackBar.getSnackBar(state.data.errorString!),
                );
              }
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: size.height * .85,
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
                          controller:
                              ResetPasswordCubit.get(context).emailController),
                      Center(
                        child: ButtonWidget(
                          onPressed: () {
                            ResetPasswordCubit.get(context)
                                .sendResetPassword(context);
                          },
                          iconData: FontAwesomeIcons.paperPlane,
                          buttonText: 'SEND',
                          iconDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
