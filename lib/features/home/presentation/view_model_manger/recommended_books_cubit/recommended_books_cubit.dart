import 'package:book/core/utils/failure.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_model.dart';
import 'package:book/features/home/data/repositories/book_details/book_details_repo_impl.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo_impl.dart';
import 'package:book/features/home/presentation/view_model_manger/book_details_cubit/book_details_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/saved_home_button_cubit/saved_home_button_cubit.dart';
import 'package:book/features/home/presentation/views/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recommended_books_state.dart';

class RecommendedBooksCubit extends Cubit<RecommendedBooksState> {
  RecommendedBooksCubit(this.homeRepo) : super(const RecommendedBooksInitial());
  final HomeRepo homeRepo;

  static RecommendedBooksCubit get(context) => BlocProvider.of(context);



  void openBookDetails(BuildContext context, String bookId) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return MultiBlocProvider(providers: [
          BlocProvider(
              create: (context) =>
              BookDetailsCubit(serviceLocator.get<BookDetailsRepoImpl>())
                ..getBook(bookId)),
          BlocProvider(
              create: (context) =>
              SavedHomeButtonCubit(serviceLocator.get<SavedRepoImpl>())
                ..getSavedAllBooks(bookId)),
        ], child: const BookDetailsScreen());
      },
      enableDrag: true,
    );
  }


  Future<void> getRecommendedBooks() async {
    emit(const LoadingState());

      var data=await homeRepo.getRecommendedBooks();
      if(data.statuesCode==200){
        emit(GetRecommendedBooksSuccessful(data.books!));
      }else{
        emit(GetRecommendedBooksHomeFailure(data.failure!));
      }

  }
}
