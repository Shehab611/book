import 'package:book/core/utils/failure.dart';
import 'package:book/features/home/data/models/book_model.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(const BooksInitial());
  final HomeRepo homeRepo;

  Future<void> getBooks() async {
    emit(const LoadingState());
    var data=await homeRepo.getBooks();
    if(data.statuesCode==200){
      emit(GetBooksSuccessful(data.books!));
    }else{
      emit(GetBooksHomeFailure(data.failure!));
    }
  }
}
