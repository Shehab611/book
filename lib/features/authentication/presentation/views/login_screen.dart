import 'package:book/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import '../widgets/login_body_widget.dart';
import '../widgets/buttons_row.dart';
import '../widgets/painter.dart';
import '../widgets/login_transform_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    double topPadding=switch(size.height){
      <=750 => 0,
      _=>size.height * 0.015625
    };
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
              padding:  EdgeInsets.fromLTRB(0,topPadding,0,10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtonsRow(),
                  SizedBox(height: size.height * .6,child: const LoginBodyWidget()),
                  GestureDetector(
                      onVerticalDragUpdate: (dd) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRouter.kRegisterScreen,
                        );
                      },
                      child: const LoginTransformWidget()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
