import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo.dart';
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


}
