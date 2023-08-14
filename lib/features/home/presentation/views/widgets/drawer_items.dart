import 'package:book/core/utils/app_router.dart';
import 'package:flutter/material.dart';


class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);
  static const List<IconData> icons = [
    Icons.home_filled,
    Icons.group_rounded,
    Icons.star_sharp,
    Icons.settings,
  ];
  static const List<String> texts = [
    'Home',
    'New Group',
    'Saved Messages',
    'Settings',
  ];
  static const List<String> routes = [
    AppRouter.kHomeScreen,
    AppRouter.kHomeScreen,
    AppRouter.kHomeScreen,
    AppRouter.kHomeScreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            icons.length,
            (index) => DrawerListItem(
                  icon: icons[index],
                  text: texts[index],
                  locationPath: routes[index],
                ))
      ],
    );
  }
}

class DrawerListItem extends StatelessWidget {
  const DrawerListItem(
      {Key? key,
      required this.icon,
      required this.text,
      required this.locationPath})
      : super(key: key);
  final IconData icon;
  final String text;
  final String locationPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 22),
      ),
      onTap: () {
        if(locationPath == AppRouter.kHomeScreen){
         Navigator.popAndPushNamed(context,  AppRouter.kHomeScreen);
        }
        else{
          Navigator.pushNamed(context, locationPath);

        }
      },
    );
  }
}
