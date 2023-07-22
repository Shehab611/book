import 'package:flutter/material.dart';
import '../components/facebook_button.dart';
import '../components/google_button.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});
  @override
  Widget build(BuildContext context) {
    return const ButtonBar(
      buttonHeight: 20,
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        GoogleButton(),
        FaceBookButton()
      ],
    );
  }
}
