import 'package:book/features/authentication/presentation/widgets/buttons_row.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_router.dart';
import '../widgets/painter.dart';
import '../widgets/register_body_widget.dart';
import '../widgets/register_transform_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GestureDetector(
                            onVerticalDragUpdate: (dd) {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRouter.kLoginScreen,
                              );
                            },
                            child: const RegisterTransformWidget())),
                    const Expanded(
                      flex: 4,
                      child: RegisterBodyWidget(),
                    ),
                    const Expanded(
                      child: ButtonsRow(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
