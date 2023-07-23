import 'package:flutter/material.dart';

import 'button_widget.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      iconData: Icons.facebook_sharp,
      onPressed: onPressed,
      buttonText: 'Facebook',
    );
  }
}
