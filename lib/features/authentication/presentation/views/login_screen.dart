import 'package:book/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';
import 'package:book/core/utils/components/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/login_body_widget.dart';
import '../widgets/buttons_row.dart';
import '../widgets/painter.dart';
import '../widgets/login_transform_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double topPadding =
        switch (size.height) { <= 750 => 0, _ => size.height * 0.015625 };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              size: size,
              painter: LoginRegisterBackground(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, 10),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginWithGoogle) {
                    if (!state.data.succsuful) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        MySnackBar.getSnackBar(state.data.errorString!),
                      );
                    }
                    else {
                      LoginCubit.get(context).ifUserExits();
                    }
                  }
                  if(state is IfUserExits){
                    if(state.data.exits){
                      LoginCubit.get(context).navigateToHome(context);
                    }
                    else {
                      LoginCubit.get(context).navigateToCompleteProfile(context);
                    }
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonsRow(
                        onPressedGoogleButton: () {
                          LoginCubit.get(context).signInWithGoogle();
                        },
                        onPressedFacebookButton: ()  {

                          // todo :: can not be add until the app is published
                        },
                      ),
                      SizedBox(
                          height: size.height * .6,
                          child: const LoginBodyWidget()),
                      GestureDetector(
                          onVerticalDragUpdate: (dd) {
                            LoginCubit.get(context).goToRegister(context);
                          },
                          child: const LoginTransformWidget()),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
