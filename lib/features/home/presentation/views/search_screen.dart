import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController _searchController = SearchController();

  // these will be reused later
  final leading = const Icon(Icons.search);
  final trailing = [
    IconButton(
      icon: const Icon(Icons.keyboard_voice),
      onPressed: () {
        print('Use voice command');
      },
    ),
    IconButton(
      icon: const Icon(Icons.camera_alt),
      onPressed: () {
        print('Use image search');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SearchAnchor(
          searchController: _searchController,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              leading: leading,
              trailing: trailing,
              onTap: () {
                _searchController.text;
                _searchController.openView();
              },
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            final keyword = controller.value.text;
            return List.generate(5, (index) => 'Item $index')
                .where((element) =>
                    element.toLowerCase().startsWith(keyword.toLowerCase()))
                .map((item) => ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                          FocusScope.of(context).unfocus();
                        });
                      },
                    ));
          },
        ),

      ],
    );
  }
}
