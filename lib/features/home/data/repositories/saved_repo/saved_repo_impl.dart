import 'package:book/core/usable_functions/firebase_data.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

final class SavedRepoImpl implements SavedRepo {

  @override
  ({List<BookDetailsModel>? books, String? errorString, bool successful})
  getAllSavedBooks() {
    try {
      List<BookDetailsModel> books = List<BookDetailsModel>.from(
          serviceLocator
              .get<Box<BookDetailsModel>>()
              .values);

      return (successful: true, errorString: null, books: books);
    } catch (e) {
      return (successful: false, errorString: e.toString(), books: null);
    }
  }

  Future<({String? errorString, bool successful})> _addBookToFireBase(
      BookDetailsModel book) async {
    try {
      await DataHandling.addDataToDocInSubCollection(collectionName: 'users',
          docName: FirebaseAuth.instance.currentUser!.email!,
          subCollectionName: 'favourites',
          subDocName: book.id,
          data: BookDetailsModel.toJson(bookDetailsModel: book));
      return (successful: true, errorString: null);
    }
    catch (e) {
      return (successful: false, errorString: e.toString());
    }
  }

  @override
  Future<({String? errorString, bool successful})> addBook(
      BookDetailsModel book) async {
    try {
      var data = await _addBookToFireBase(book);
      if (!data.successful) {
        throw UnsupportedError(data.errorString!);
      }
      await serviceLocator.get<Box<BookDetailsModel>>().put(book.id, book);
      return (successful: true, errorString: null);
    } catch (e) {
      return (successful: false, errorString: e.toString());
    }
  }


  Future<({String? errorString, bool successful})> _removeBookFromFireBase(
      String bookId) async{
    try {
      DataHandling.removeDocInSubCollection(collectionName: 'users',
        docName: FirebaseAuth.instance.currentUser!.email!,
        subCollectionName: 'favourites',
        subDocName: bookId);
      return (successful: true, errorString: null);
    }
    catch (e) {

      return (successful: false, errorString: e.toString());
    }
  }


  @override
  Future<({String? errorString, bool successful})> removeBook(String bookId) async {
    try {
      var data = await _removeBookFromFireBase(bookId);
      if (!data.successful) {
        throw UnsupportedError(data.errorString!);
      }
      await serviceLocator.get<Box<BookDetailsModel>>().delete(bookId);
      return (successful: true, errorString: null);
    } catch (e) {
      return (successful: false, errorString: e.toString());
    }
  }
}
