import 'package:book/constants.dart';
import 'package:flutter/material.dart';

class GoInButton extends StatelessWidget {
  const GoInButton(
      {super.key, required this.onPressed, required this.iconData});

  final void Function() onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: kDefaultColor,
      child: Icon(iconData,size: 40,color: kColor),
    );
  }
}
