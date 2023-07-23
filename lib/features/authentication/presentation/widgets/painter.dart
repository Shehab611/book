import 'package:book/constants.dart';
import 'package:flutter/material.dart';

class LoginRegisterBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width, y = size.height;
    Paint paint = Paint()..color = kDefaultColor;
    Paint paint1 = Paint()..color = kDefaultColor.withOpacity(.2);
    //#region above curve
    final path = drawAboveCurve(x,y);

    //#endregion

    //region bottom curve
    final path2 =drawBottomCurve(x,y);

    //endregion

    //region color in between
    final path3 = drawColorInBetween(x,y);

    //endregion

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

  Path drawAboveCurve(double x, double y) {
    final path = Path();
    path.moveTo(x, 0);
    path.lineTo(x, y * .1);
    path.quadraticBezierTo(x, y * 0.15, x * 0.60, y * 0.15);
    path.lineTo(x * 0.58, y * 0.15);
    path.quadraticBezierTo(x, y * .1, x * .995, 0);
    path.close();
    return path;
  }

  Path drawBottomCurve(double x, double y) {
    final path = Path();
    path.moveTo(0, y * .7);
    path.lineTo(0, y * .8);
    path.quadraticBezierTo(0, y * .85, x * .4, y * .85);
    path.lineTo(x * 0.48, y * .85);
    path.quadraticBezierTo(0, y * .8, 0, y * .7);
    path.close();
    return path;
  }

  Path drawColorInBetween(double x, double y) {
    final path = Path();
    path.moveTo(x, y * .1);
    path.lineTo(x, y * .825);
    path.lineTo(x * 0.48, y * .85);
    path.quadraticBezierTo(0, y * .8, 0, y * .7);
    path.lineTo(0, y * 0.185);
    path.lineTo(x * 0.58, y * 0.15);
    return path;
  }

}

class CompleteProfileBackgroundCurve extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kDefaultColor;
    Path path = Path();
    double h = size.height * 0.32;
    double w = size.width;
    path.lineTo(0, h / 2);
    path.cubicTo(5 * (w / 12), -(25 * (h / 336)), 7 * (w / 9), h , w, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class VerificationBackgroundCurve extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width, y = size.height;
    Paint paint = Paint()..color = kDefaultColor;
    final path = Path();
    path.moveTo(0, y * .8);
    path.quadraticBezierTo(x * .5, y * .6, x, y * .82);
    path.lineTo(x, y);
    path.lineTo(0, y);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
}
