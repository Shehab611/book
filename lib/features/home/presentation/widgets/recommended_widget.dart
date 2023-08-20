import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/repositories/book_details/book_details_repo_impl.dart';
import 'package:book/features/home/presentation/components/book_info.dart';
import 'package:book/features/home/presentation/view_model_manger/book_details_cubit/book_details_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/recommended_books_cubit/recommended_books_cubit.dart';
import 'package:book/features/home/presentation/views/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<RecommendedBooksCubit, RecommendedBooksState>(
          builder: (context, state) {
            if(state is GetRecommendedBooksSuccessful){
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return  GestureDetector(
                    onTap: (){
                      showBottomSheet(context: context,
                        builder: (context) {
                          return BlocProvider(
                            create: (context) =>
                            BookDetailsCubit(serviceLocator.get<BookDetailsRepoImpl>())..getBook(state.books[index].id),
                            child: const BookDetailsScreen() ,
                          );

                        },enableDrag: true,);
                    },
                    child: BookInfoItem(
                      imagePath:
                     state.books[index].volumeInfo.imageLinks.thumbnail??'',
                      title: state.books[index].volumeInfo.title??'',
                      authors: state.books[index].volumeInfo.authors??[],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                const Divider(
                  thickness: 1.8,
                ),
                itemCount:state.books.length,
              );
            }
            else if (state is GetRecommendedBooksHomeFailure){
            return  Center(child: Text(state.failure.errMessage),);
            }
            return const Center(child: CircularProgressIndicator(),);

          },
        ),
      ),
    );
  }
}
