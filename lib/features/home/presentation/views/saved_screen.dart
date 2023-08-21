import 'package:book/features/home/presentation/components/saved_item.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      drawer: DrawerView(),
      body: Center(
        child:SavedItem() ,
      ),
    );
  }
}
