part of 'book_details_cubit.dart';


abstract class BookDetailsState {
  const BookDetailsState();
}

class BookDetailsInitial extends BookDetailsState {
  const BookDetailsInitial();
}
class BookDetailsLoading extends BookDetailsState {
  const BookDetailsLoading();
}
class GetBookDetailsSuccessful extends BookDetailsState {
  final BookDetailsModel book;

  const GetBookDetailsSuccessful(this.book);
}
class GetBookDetailsFailure extends BookDetailsState {
  final Failure failure;

 const GetBookDetailsFailure(this.failure);
}
