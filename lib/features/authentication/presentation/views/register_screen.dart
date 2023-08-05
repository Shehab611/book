import 'package:book/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:book/features/authentication/presentation/widgets/buttons_row.dart';
import 'package:book/features/authentication/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/painter.dart';
import '../widgets/register_body_widget.dart';
import '../widgets/register_transform_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context,state){
                    if (state is SignUpWithGoogle) {
                      if (!state.data.succsuful) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          MySnackBar.getSnackBar(state.data.errorString!),);
                      }
                      else{
                        RegisterCubit.get(context).navigateToCompleteProfileFromGoogle(context);
                      }
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onVerticalDragUpdate: (dd) {
                              RegisterCubit.get(context).goToLogin(context);
                            },
                            child: const RegisterTransformWidget()),
                        SizedBox(
                            height: size.height * .6,
                            child: const RegisterBodyWidget()),
                        ButtonsRow(
                          onPressedGoogleButton: () {
                            RegisterCubit.get(context).signUpWithGoogle();



                            // todo :: go to complete verification page
                          },
                          onPressedFacebookButton: () {
                            // todo :: can not be add until the app is published
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
