import 'package:book/core/utils/failure.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_model.dart';
import 'package:book/features/home/data/repositories/book_details/book_details_repo_impl.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:book/features/home/presentation/view_model_manger/book_details_cubit/book_details_cubit.dart';
import 'package:book/features/home/presentation/views/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(const BooksInitial());
  final HomeRepo homeRepo;

  static BooksCubit get(context) => BlocProvider.of(context);

  Future<void> getBooks() async {
    emit(const LoadingState());
    var data = await homeRepo.getBooks();
    if (data.statuesCode == 200) {
      emit(GetBooksSuccessful(data.books!));
    } else {
      emit(GetBooksHomeFailure(data.failure!));
    }
  }

  void openBookDetails(BuildContext context, String bookId) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) =>
              BookDetailsCubit(serviceLocator.get<BookDetailsRepoImpl>())
                ..getBook(bookId),
          child: const BookDetailsScreen(),
        );
      },
      enableDrag: true,
    );
  }
}
