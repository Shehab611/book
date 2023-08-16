import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);
  static const Map<String,IconData> drawerItems = {
    'Home': Icons.library_books,
    'Profile': Icons.person,
    'Settings': Icons.settings,
    'Logout': Icons.logout
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            drawerItems.length,
            (index) => DrawerItem(
                  iconData: drawerItems.values.toList()[index],
                  text:  drawerItems.keys.toList()[index],
                ))
      ],
    );
  }
}

// drawer item class
// keep logged in switch button
// home
// saved books
// settings
// log out
class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: kColor,
        size: 35,
      ),
      title: Text(
        text,
        style: GoogleFonts.montserrat(
                color: kColor, fontWeight: FontWeight.w800)
            .copyWith(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
      ),
    );
  }
}
