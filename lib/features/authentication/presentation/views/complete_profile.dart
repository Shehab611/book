import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/widgets/my_stepper.dart';
import 'package:book/features/authentication/presentation/widgets/painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            painter: BackgroundCurve(),
            size: size,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Complete Profile',
                    style:GoogleFonts.montserrat(
                        color: kColor, fontWeight: FontWeight.w800)
                        .copyWith(
                        fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize),
                  ),
                ),
                const SizedBox(height:30,),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: kColor,
                      backgroundImage:
                      AssetImage('assets/user_image.jpg')
                      ,
                    ),
                    FloatingActionButton.small(
                      onPressed: () {},
                      backgroundColor: kDefaultColor,
                      child: const Icon(Icons.add_a_photo_outlined),
                    )
                  ],
                ),
                const MyStepper(),
              ],
            ),
          )

        ],
      ),
    );
  }
}








