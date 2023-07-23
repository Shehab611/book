import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'button_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(iconData:FontAwesomeIcons.google , onPressed: onPressed, buttonText: 'Google',);
  }
}
