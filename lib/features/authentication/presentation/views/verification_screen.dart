import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/components/button_widget.dart';
import 'package:book/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
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
                          'Please check your email for confirmation mail. Click link in email to verify your account',
                    ),
                    Lottie.asset(
                      'assets/animated_json/verification_animation.json',
                      height: size.height * .4,
                    ),
                    ButtonWidget(
                        onPressed: () {
                          RegisterCubit.get(context).navigateToCompleteProfile(context);
                        },
                        iconDirection: TextDirection.rtl,
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        buttonBackgroundColor: kColor,
                        iconData: FontAwesomeIcons.user,
                        buttonText: 'Complete Profile'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
