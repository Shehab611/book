import 'package:book/features/authentication/presentation/widgets/my_stepper.dart';
import 'package:book/features/authentication/presentation/widgets/painter.dart';
import 'package:flutter/material.dart';

import '../widgets/before_stepper.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            painter: CompleteProfileBackgroundCurve(),
            size: size,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0,15,0,0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BeforeStepper(),
                  MyStepper(),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}









