import 'package:book/core/utils/failure.dart';
import 'package:book/features/home/data/models/book_details_model.dart';

abstract interface class BookDetailsRepo{
  Future<({int statuesCode,BookDetailsModel? book,Failure? failure})> getBookDetails(String bookID);
  Future<({bool successful, String? errorString})> saveBook(BookDetailsModel bookDetailsModel);
}