import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/go_in_button.dart';
import '../components/text_field.dart';
import 'snack_bar.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Form(
      key: LoginCubit.get(context).formKey,
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
              keyboardType: TextInputType.emailAddress,
              iconData: Icons.email_outlined,
              controller: LoginCubit.get(context).emailController,
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
              controller: LoginCubit.get(context).passwordController,
              isLast: true,
              obscureText: true,
              onFieldSubmitted: (p0) =>
                  LoginCubit.get(context).formKey.currentState!.validate(),
              validator: (String? value) {
                switch (value!.isEmpty) {
                  case true:
                    return 'Password can not be empty';
                  case false:
                    return null;
                }
              },
            ),
            Align(
                alignment: Alignment.lerp(
                    Alignment.center, Alignment.centerRight, .9)!,
                child: TextButton(
                    onPressed: () {
                      LoginCubit.get(context).navigateToForgetPassword(context);
                    },
                    child: Text(
                      'Forgot password',
                      style: GoogleFonts.libreCaslonText(
                          color: kDefaultColor, fontSize: 17),
                    ))),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return GoInButton(
                  onPressed: () {
                    LoginCubit.get(context).userLogin(context);
                    if (state is UserLogin) {
                      if (!state.data.succsuful) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          MySnackBar.getSnackBar(state.data.errorString!),);
                      }
                    }
                  },
                  iconData: Icons.arrow_forward_ios_outlined,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
