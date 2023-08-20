import 'package:book/core/utils/failure.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/book_details/book_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.bookDetailsRepo) : super(const BookDetailsInitial());

  final BookDetailsRepo bookDetailsRepo;

  static BookDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> getBook(String bookID) async {
    emit(const BookDetailsLoading());
    var data=await bookDetailsRepo.getBookDetails(bookID);
    if(data.statuesCode==200){
      emit(GetBookDetailsSuccessful(data.book!));
    }else{
      emit(GetBookDetailsFailure(data.failure!));
    }
  }

    Future<void> lunchUrl(String url)async {
      final Uri urlLunch = Uri.parse(url);
      await launchUrl(urlLunch);
    }
}
