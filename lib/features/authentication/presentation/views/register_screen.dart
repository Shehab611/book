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
                padding:
                     EdgeInsets.fromLTRB(0,topPadding,0,10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onVerticalDragUpdate: (dd) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRouter.kLoginScreen,
                          );
                        },
                        child: const RegisterTransformWidget()),
                    SizedBox(height: size.height * .6,child: const RegisterBodyWidget()),
                     ButtonsRow(onPressedGoogleButton: () async{
                       // todo :: add google sign up method
                     }, onPressedFacebookButton: () {
                       // todo :: can not be add until the app is published
                     },),
                  ] ,
                ),
              )
            ],
          ),
        ));
  }
}
