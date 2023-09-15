import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/book_details/book_details_repo_impl.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo_impl.dart';
import 'package:book/features/home/presentation/view_model_manger/book_details_cubit/book_details_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/saved_home_button_cubit/saved_home_button_cubit.dart';
import 'package:book/features/home/presentation/views/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_screen_state.dart';

class SavedScreenCubit extends Cubit<SavedScreenState> {
  SavedScreenCubit(this._savedRepo) : super(const SavedScreenInitial());
  final SavedRepo _savedRepo;

  static SavedScreenCubit get(context) => BlocProvider.of(context);

  final GlobalKey<AnimatedListState> key = GlobalKey();
  late List<BookDetailsModel>  books;

  void getAllBooks(){
    emit(const SavedScreenLoading());
    books = _savedRepo.getAllSavedBooks().books!;
     if(books.isNotEmpty){
       emit(GetAllBooksSuccessful(books));
     }
     else{
       emit(const GetAllBooksFailure());
     }

 }

   removeBookFromFav(int index){
    var book=books.removeAt(index);
    _savedRepo.removeBook(book.id);
    emit(const RemoveBook());
  }

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
}
