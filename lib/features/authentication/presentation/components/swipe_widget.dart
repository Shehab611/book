import 'package:book/constants.dart';
import 'package:flutter/material.dart';

class SwipeWidget extends StatelessWidget {
  const SwipeWidget({super.key, required this.iconData,this.alignmentGeometry=Alignment.center,});
final IconData iconData;
final AlignmentGeometry? alignmentGeometry;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry!,
      child: Container(
        height: 75, width: 45,
        decoration:BoxDecoration(
            color:  kDefaultColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(25)
        ),
        child: Icon(iconData,color: kColor,size: 28,),
      ),
    );
  }
}
