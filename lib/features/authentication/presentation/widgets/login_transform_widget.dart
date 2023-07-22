import 'package:flutter/material.dart';

import '../components/swipe_widget.dart';
import '../components/texts.dart';

class LoginTransformWidget extends StatelessWidget {
  const LoginTransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TextWidget(aboveText: 'New Member',bottomText: 'Swipe up',),
        SwipeWidget(
          iconData: Icons.swipe_up,
          alignmentGeometry: Alignment.lerp(
              Alignment.center, Alignment.centerRight, .8)!,
        ),

      ],
    );
  }
}
