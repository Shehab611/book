import 'package:book/core/utils/failure.dart';
import 'package:book/features/home/data/models/book_model.dart';

abstract interface class HomeRepo{
  Future<({int statuesCode,List<BookModel>? books,Failure? failure})> getBooks();
}