import 'package:flutter/material.dart';

import 'image_selection.dart';

class BeforeStepper extends StatelessWidget {
  const BeforeStepper({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double distanceUnderCurve =
        switch (height) { <= 750 => height * .048, _ => height * .063 };
    return Column(
      children: [

        SizedBox(
          height: distanceUnderCurve,
        ),
        const ImageSelection(),
      ],
    );
  }
}
