import 'package:book/constants.dart';
import 'package:book/features/home/presentation/components/saved_item.dart';
import 'package:book/features/home/presentation/view_model_manger/saved_screen_cubit/saved_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'drawer.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultColor,
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
      body: BlocConsumer<SavedScreenCubit, SavedScreenState>(
        listener: (context, state) {
          if (state is RemoveBook) {
            SavedScreenCubit.get(context).getAllBooks();
          }
        },
        builder: (context, state) {
          var savedContext = context;
          if (state is GetAllBooksFailure) {
            return Column(
              children: [
                Lottie.asset('assets/animated_json/no_data_animation.json'),
                const Text(
                  'You Have No books Saved Yet',
                  style: TextStyle(
                      color: kColor, fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            );
          } else if (state is GetAllBooksSuccessful) {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey<String>(state.books[index].volumeInfo.title),
                  background: Container(
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          Text('Remove from saved',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Remove Confirmation",
                            style: GoogleFonts.montserrat(
                                    color: kDefaultColor,
                                    fontWeight: FontWeight.w800)
                                .copyWith(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize),
                          ),
                          content: Text(
                              "Are you sure you want to Remove this saved book?",
                              style: GoogleFonts.montserrat(
                                      color: kDefaultColor,
                                      fontWeight: FontWeight.w600)
                                  .copyWith(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.fontSize)),
                          backgroundColor: kColor,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 10,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  SavedScreenCubit.get(savedContext)
                                      .removeBookFromFav(index);
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text(
                                  "Remove",
                                  style: TextStyle(color: kDefaultColor),
                                )),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: kDefaultColor),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      SavedScreenCubit.get(context)
                          .openBookDetails(context, state.books[index].id);
                    },
                    child: SavedItem(
                      imagePath:
                          state.books[index].volumeInfo.imageLinks.thumbnail!,
                      title: state.books[index].volumeInfo.title,
                      authors: state.books[index].volumeInfo.authors,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
