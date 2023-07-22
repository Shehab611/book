import 'package:flutter/material.dart';

import 'button_widget.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      iconData: Icons.facebook_sharp,
      onPressed: () {},
      buttonText: 'Facebook',
    );
  }
}
