import 'package:flutter/material.dart';
import '../components/facebook_button.dart';
import '../components/google_button.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, required this.onPressedGoogleButton, required this.onPressedFacebookButton});
  final void Function() onPressedGoogleButton;
  final void Function() onPressedFacebookButton;
  @override
  Widget build(BuildContext context) {
    return  ButtonBar(
      buttonHeight: 20,
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        GoogleButton(onPressed:onPressedGoogleButton ,),
        FaceBookButton(onPressed:onPressedFacebookButton,)
      ],
    );
  }
}
