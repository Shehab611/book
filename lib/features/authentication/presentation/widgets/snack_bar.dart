import 'package:book/constants.dart';
import 'package:flutter/material.dart';

 class MySnackBar{
  static SnackBar getSnackBar(String snackBarText){
    return SnackBar(
      content: Text(snackBarText),
      elevation: 7,
      duration: const Duration(seconds: 5),
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
