import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/texts.dart';
import '../widgets/painter.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: size,
            painter: VerificationBackgroundCurve(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextWidget(
                  aboveText: 'Yeah! Confirm Your Email 🎉',
                  aboveTextAlign: TextAlign.center,
                  bottomTextAlign: TextAlign.center,
                  aboveTextColor: kDefaultColor,
                  bottomTextColor: kColor,
                  bottomText:
                      'Please check your email for confirmation mail. Click link in email to verification your account',
                ),
                Lottie.asset(
                  'assets/animated_json/verification_animation.json',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
