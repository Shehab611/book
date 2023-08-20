import 'package:book/features/home/presentation/components/book_info.dart';
import 'package:book/features/home/presentation/view_model_manger/recommended_books_cubit/recommended_books_cubit.dart';
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
                      RecommendedBooksCubit.get(context).openBookDetails(context, state.books[index].id);
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
