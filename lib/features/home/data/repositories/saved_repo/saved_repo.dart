import 'package:book/features/home/data/models/book_details_model.dart';

abstract interface class SavedRepo{

  ({bool successful,List<BookDetailsModel>? books, String? errorString}) getAllSavedBooks();
  Future<({bool successful, String? errorString})> removeBook(String bookId);
  Future<({bool successful, String? errorString})> addBook(BookDetailsModel book);


}