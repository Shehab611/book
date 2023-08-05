import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:book/features/authentication/presentation/widgets/my_stepper.dart';
import 'package:book/features/authentication/presentation/widgets/painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/before_stepper.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(elevation: 0,
        backgroundColor: kDefaultColor,
        leading: IconButton(onPressed: (){
          CompleteProfileCubit.get(context).logOut(context);
        }, icon:const Icon(Icons.logout)),
        title:  Center(
          child: Text(
            'Complete Profile',
            style: GoogleFonts.montserrat(
                color: kColor, fontWeight: FontWeight.w800)
                .copyWith(
                fontSize:
                Theme.of(context).textTheme.headlineSmall?.fontSize),
          ),
        ),
      ),
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









