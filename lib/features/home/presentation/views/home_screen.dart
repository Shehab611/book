import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/home_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultColor.withOpacity(.2),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: kDefaultColor.withOpacity(.2),
        elevation: 0,
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body:const HomeBodyWidget(),
    );
  }
}
