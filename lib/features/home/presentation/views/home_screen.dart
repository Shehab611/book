import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title:Text(
          'Home',
          style: GoogleFonts.montserrat(
              color: kColor, fontWeight: FontWeight.w800)
              .copyWith(
              fontSize: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.fontSize),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search,size: 30,color: kColor,)),
        ],
      ),
      body:const HomeBodyWidget(),
    );
  }
}
