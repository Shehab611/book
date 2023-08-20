import 'package:book/features/home/presentation/components/image_item.dart';
import 'package:book/features/home/presentation/view_model_manger/books_cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksWidget extends StatelessWidget {
  const AllBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverToBoxAdapter(
          child: BlocBuilder<BooksCubit,BooksState>(
            builder: (context, state) {
              if(state is GetBooksSuccessful){
                return SizedBox(
                  height: screenSize.height * .32,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return  ImageItem(
                            imagePath:
                           state.books[index].volumeInfo.imageLinks.thumbnail!,
                            width: screenSize.width * .42,
                            height: screenSize.height*.29,);
                      },
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        width: 8,
                      ),
                      itemCount: state.books.length),
                );
              }
              else if (state is GetBooksHomeFailure){
                return  Center(child: Text(state.failure.errMessage),);
              }
              return const Center(child: CircularProgressIndicator(),);
            },
          ),
        ));
  }
}
