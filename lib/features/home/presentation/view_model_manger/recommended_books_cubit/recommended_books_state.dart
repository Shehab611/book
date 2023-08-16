part of 'recommended_books_cubit.dart';


sealed class RecommendedBooksState {
  const RecommendedBooksState();
}

class RecommendedBooksInitial extends RecommendedBooksState {
  const RecommendedBooksInitial();
}
class LoadingState extends RecommendedBooksState {
  const LoadingState();
}
class GetRecommendedBooksSuccessful extends RecommendedBooksState {
  final List<BookModel> books;

  const GetRecommendedBooksSuccessful(this.books);
}
class GetRecommendedBooksHomeFailure extends RecommendedBooksState {
  final Failure failure;

  const GetRecommendedBooksHomeFailure(this.failure);
}
