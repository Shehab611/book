part of 'saved_home_button_cubit.dart';

abstract class SavedHomeButtonState {
  const SavedHomeButtonState();
}

class SavedHomeButtonInitial extends SavedHomeButtonState {
  const SavedHomeButtonInitial();
}

class SavedHomeButtonSaveBookSuccessful extends SavedHomeButtonState {

  const SavedHomeButtonSaveBookSuccessful();
}

class SavedHomeButtonRemoveBookSuccessful extends SavedHomeButtonState {

  const SavedHomeButtonRemoveBookSuccessful();
}

class SavedHomeButtonSaveBookFailure extends SavedHomeButtonState {
final Failure failure;
  const SavedHomeButtonSaveBookFailure(this.failure);
}

class SavedHomeButtonRemoveBookFailure extends SavedHomeButtonState {
final Failure failure;
  const SavedHomeButtonRemoveBookFailure(this.failure);
}

class GetAllSavedBooksSuccessful extends SavedHomeButtonState{
  const GetAllSavedBooksSuccessful();
}

class ContainBook extends SavedHomeButtonState{
  const ContainBook();
}

class DoesNotContainBook extends SavedHomeButtonState{
  const DoesNotContainBook();
}