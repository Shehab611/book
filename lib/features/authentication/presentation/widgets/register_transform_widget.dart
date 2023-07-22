import 'package:flutter/material.dart';

import '../components/swipe_widget.dart';
import '../components/texts.dart';

class RegisterTransformWidget extends StatelessWidget {
  const RegisterTransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextWidget(aboveText: 'Already Member',bottomText: 'Swipe down',),
        SwipeWidget(
          iconData: Icons.swipe_down,
        ),
      ],
    );
  }
}
