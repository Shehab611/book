import 'package:book/constants.dart';
import 'package:book/features/authentication/presentation/components/texts.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/presentation/components/image_item.dart';
import 'package:book/features/home/presentation/view_model_manger/book_details_cubit/book_details_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/saved_home_button_cubit/saved_home_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      height: screenSize.height * .85,
      child: Scaffold(
        backgroundColor: kDefaultColor.withOpacity(.2),
        appBar: AppBar(
          backgroundColor: kDefaultColor.withOpacity(.2),
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: kColor,
              )),
        ),
        body: BlocBuilder<BookDetailsCubit, BookDetailsState>(
          builder: (context, state) {
            if (state is GetBookDetailsFailure) {
              return Center(
                child: Text(state.failure.errMessage),
              );
            } else if (state is GetBookDetailsSuccessful) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageItem(
                          height: screenSize.height * .38,
                          width: screenSize.width * .6,
                          imagePath:
                          state.book.volumeInfo.imageLinks.thumbnail ?? '',
                        ),
                        TextWidget(
                            aboveText: state.book.volumeInfo.title,
                            aboveTextFontSize: Theme
                                .of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                            bottomTextFontSize: Theme
                                .of(context)
                                .textTheme
                                .titleMedium
                                ?.fontSize,
                            bottomText:
                            state.book.volumeInfo.authors[0].toString(),
                            aboveTextAlign: TextAlign.center,
                            crossAxisAlignment: CrossAxisAlignment.center),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kDefaultColor.withOpacity(.2)),
                          child: Text(
                            state.book.volumeInfo.description,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.libreCaslonText(
                                color: kColor,
                                fontWeight: FontWeight.w700,
                                fontSize: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.fontSize),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .17,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: screenSize.height * .1,
                    decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                        color: kDefaultColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 6.3,
                            ),
                            Text(
                              state.book.volumeInfo.averageRating.toString(),
                              style: TextStyle(
                                fontSize: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.fontSize,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Opacity(
                              opacity: .5,
                              child: Text(
                                '(${state.book.volumeInfo.ratingsCount.toString()})',
                                style: TextStyle(
                                  fontSize: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: ElevatedButton(
                                  onPressed: () {
                                    BookDetailsCubit.get(context).lunchUrl(
                                        state.book.volumeInfo.previewLink);
                                  },
                                  child: Text(
                                    'Preview Link',
                                    style: GoogleFonts.libreCaslonText(
                                        color: kColor,
                                        fontSize: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontSize),
                                  )),
                            ),
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: BlocBuilder<SavedHomeButtonCubit,
                                  SavedHomeButtonState>(
                                builder: (context, state) {
                                  BookDetailsModel book = (BookDetailsCubit
                                      .get(context)
                                      .state as GetBookDetailsSuccessful)
                                      .book;
                                  return ElevatedButton(
                                      onPressed: () {
                                        SavedHomeButtonCubit.get(context)
                                            .buttonPressed(book);
                                      },
                                      child: Text(
                                        SavedHomeButtonCubit.get(context)
                                            .getButtonText(),
                                        style: GoogleFonts.libreCaslonText(
                                            color: kColor,
                                            fontSize: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.fontSize),
                                      ));
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
