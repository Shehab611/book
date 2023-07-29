import 'package:book/constants.dart';
import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key,this.snackBarText});
  final String? snackBarText;
  @override
  Widget build(BuildContext context) {
    return   SnackBar(
      content: Text(snackBarText!),
      elevation: 7,
      duration: const Duration(seconds: 2),
      backgroundColor: kColor,
      animation: CurvedAnimation(
          parent: kAlwaysCompleteAnimation, curve: Curves.bounceOut),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      action: SnackBarAction(
        label: 'close',
        textColor: kDefaultColor,
        onPressed: () {},
      ),
    );
  }
}
