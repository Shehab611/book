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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              size: size,
              painter: BackgroundPainter(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              child: Column(
                children: [
                  const ButtonsRow(),
                  const Expanded(flex: 6, child: LoginBodyWidget()),
                  Expanded(
                    child: GestureDetector(
                        onVerticalDragUpdate: (dd) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRouter.kRegisterScreen,
                          );
                        },
                        child: const LoginTransformWidget()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
