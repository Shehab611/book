part of 'books_cubit.dart';


sealed class BooksState {
  const BooksState();
}

class BooksInitial extends BooksState {
  const BooksInitial();
}
class LoadingState extends BooksState {
  const LoadingState();
}
class GetBooksSuccessful extends BooksState {
  final List<BookModel> books;

  const GetBooksSuccessful(this.books);
}
class GetBooksHomeFailure extends BooksState {
  final Failure failure;

  const GetBooksHomeFailure(this.failure);
}
