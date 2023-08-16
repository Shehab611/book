import 'package:book/core/utils/failure.dart';
import 'package:book/features/home/data/models/book_model.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recommended_books_state.dart';

class RecommendedBooksCubit extends Cubit<RecommendedBooksState> {
  RecommendedBooksCubit(this.homeRepo) : super(const RecommendedBooksInitial());
  final HomeRepo homeRepo;
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
