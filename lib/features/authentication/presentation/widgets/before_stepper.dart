import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeforeStepper extends StatelessWidget {
  const BeforeStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ],);
  }
}