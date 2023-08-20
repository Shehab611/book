import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SearchAnchor.bar(
          searchController: _searchController,
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
                          controller.closeView(null);
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
