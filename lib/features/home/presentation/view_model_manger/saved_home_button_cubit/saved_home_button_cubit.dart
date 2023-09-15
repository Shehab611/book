import 'package:book/core/utils/failure.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_home_button_state.dart';

class SavedHomeButtonCubit extends Cubit<SavedHomeButtonState> {
  SavedHomeButtonCubit(this._savedRepo) : super(const SavedHomeButtonInitial());
  final SavedRepo _savedRepo;
  bool _isSaved=false;

  String _buttonText='Save Book';

  static SavedHomeButtonCubit get(context) => BlocProvider.of(context);

  String getButtonText()=>_buttonText;

  void _removeBook(String bookId) async {
    ({String? errorString, bool successful}) data =
        await _savedRepo.removeBook(bookId);
    if (data.successful) {
      emit(const SavedHomeButtonRemoveBookSuccessful());
    } else {
      emit(SavedHomeButtonRemoveBookFailure(ServerFailure(data.errorString!)));
    }
  }

  void _addBook(BookDetailsModel book) async {
    var data = await _savedRepo.addBook(book);
    if (data.successful) {
      emit(const SavedHomeButtonSaveBookSuccessful());
    } else {

      emit(SavedHomeButtonSaveBookFailure(ServerFailure(data.errorString!)));
    }
  }

  void buttonPressed(BookDetailsModel book){
    if(!_isSaved){
      _isSaved=!_isSaved;
      _buttonText='unsave Book';
      _addBook(book);
      emit(const BookSaved());
    }
    else{
      _isSaved=!_isSaved;
      _buttonText='Save Book';
      _removeBook(book.id);
      emit(const BookUnSaved());
    }

  }

  void getSavedAllBooks(String bookId){
    var data=_savedRepo.getAllSavedBooks();
    if(data.successful){
      emit(const GetAllSavedBooksSuccessful());
      bool containBook=data.books!.any((element) => element.id==bookId);
      if(containBook){
        _isSaved=true;
        _buttonText='unsave Book';
        emit(const ContainBook());
      }else{
        _isSaved=false;
        _buttonText='Save Book';
        emit(const DoesNotContainBook());
      }
    }
  }
}
