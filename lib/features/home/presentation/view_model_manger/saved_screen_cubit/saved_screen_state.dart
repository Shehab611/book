part of 'saved_screen_cubit.dart';


abstract class SavedScreenState {
  const SavedScreenState();
}

class SavedScreenInitial extends SavedScreenState {
 const SavedScreenInitial();
}

class SavedScreenLoading extends SavedScreenState {
 const SavedScreenLoading();
}

class GetAllBooksSuccessful extends SavedScreenState{
  final List<BookDetailsModel> books;
  const GetAllBooksSuccessful(this.books);
}

class GetAllBooksFailure extends SavedScreenState{
  const GetAllBooksFailure();
}

class RemoveBook extends SavedScreenState{
  const RemoveBook();
}


