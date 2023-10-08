import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/go_in_button.dart';
import '../components/text_field.dart';
import '../../../../core/utils/components/snack_bar.dart';

class RegisterBodyWidget extends StatelessWidget {
  const RegisterBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is UserRegister) {
              if (!state.data.succsuful) {
                ScaffoldMessenger.of(context).showSnackBar(
                  MySnackBar.getSnackBar(state.data.errorString!),
                );
              } else {
                RegisterCubit.get(context).verifyUserEmail();
                RegisterCubit.get(context)
                    .navigateToVerificationScreen(context);
              }
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Create ',
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: kColor,
                          fontWeight: FontWeight.bold),
                      children: const [
                        TextSpan(
                            text: 'Account ',
                            style: TextStyle(color: kDefaultColor)),
                      ]),
                ),
                MyTextField(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  iconData: Icons.email_outlined,
                  controller: RegisterCubit.get(context).emailController,
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
                  controller: RegisterCubit.get(context).passwordController,
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
                  controller:
                      RegisterCubit.get(context).confirmPasswordController,
                  obscureText: true,
                  isLast: true,
                  validator: (String? value) {
                    switch (value!.isEmpty) {
                      case true:
                        return 'Confirm Password Can not be empty';
                      case false:
                        return value.compareTo(RegisterCubit.get(context)
                                    .passwordController
                                    .text) !=
                                0
                            ? 'Passwords are not equivalent'
                            : null;
                    }
                  },
                  onFieldSubmitted: (p0) =>
                      RegisterCubit.get(context).userRegister(context),
                ),
                GoInButton(
                  onPressed: () {
                    RegisterCubit.get(context).userRegister(context);
                  },
                  iconData: Icons.arrow_forward_ios_outlined,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
