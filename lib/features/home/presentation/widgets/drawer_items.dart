import 'package:book/constants.dart';
import 'package:book/features/home/presentation/view_model_manger/drawer_cubit/drawer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
  builder: (context, state) {
     const Map<String,IconData> drawerItems = {
      'Home': Icons.library_books,
      'Profile': Icons.person,
      'Settings': Icons.settings,
      'Logout': Icons.logout
    };

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.login_outlined,color: kColor,
            size: 35,),
          title: Text('Keep logged in', style: GoogleFonts.montserrat(
              color: kColor, fontWeight: FontWeight.w800)
              .copyWith(
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
          trailing:  Transform.scale(
            scale: .8,
            child: Switch(
                value:DrawerCubit.get(context).value??true,
                onChanged: (val) {
                  DrawerCubit.get(context).changeLoggedInValue(val);
                },
                activeColor:kColor
            ),
          ),
        ),
        ...List.generate(
            drawerItems.length,
            (index) => DrawerItem(
                  iconData: drawerItems.values.toList()[index],
                  text:  drawerItems.keys.toList()[index],
                ))
      ],
    );
  },
);
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.iconData, required this.text,});

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
      onTap: (){
      },
    );
  }
}
