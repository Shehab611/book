import 'package:book/constants.dart';
import 'package:book/features/home/presentation/components/saved_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final List<String> items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultColor.withOpacity(.2),
      appBar: AppBar(
        backgroundColor: kDefaultColor.withOpacity(.2),
        elevation: 0,
        title: Text(
          'Saved Books',
          style:
              GoogleFonts.montserrat(color: kColor, fontWeight: FontWeight.w800)
                  .copyWith(
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize),
        ),
        centerTitle: true,
      ),
      drawer: const DrawerView(),
      body: AnimatedList(
        key: key,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: const SavedItem(
                imagePath:
                    'http://books.google.com/books/content?id=GsPDEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                title: 'title',
                authors: ['authors']),
          );
        },
      ),
    );
  }

  void insertItems() {
    var index = items.length;
    items.add('item ${index + 1}');
    key.currentState!.insertItem(index);
  }

  void deleteItem(int index) {
    items.removeAt(index);
    key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: Item(text: items[index], onPressed: () {})));
  }
}

class Item extends StatelessWidget {
  const Item({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.add),
      title: Text(text),
      trailing:
          IconButton(onPressed: onPressed, icon: const Icon(Icons.delete)),
    );
  }
}
