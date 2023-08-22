import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo.dart';
import 'package:hive/hive.dart';

final class SavedRepoImpl implements SavedRepo {
  @override
  Future<({String? errorString, bool successful})> addBook(
      BookDetailsModel book) async {
    try {
      await serviceLocator.get<Box<BookDetailsModel>>().put(book.id, book);
      return (successful: true, errorString: null);
    } catch (e) {
      return (successful: false, errorString: e.toString());
    }
  }

  @override
  ({List<BookDetailsModel>? books, String? errorString, bool successful})
      getAllSavedBooks() {
    try {
      List<BookDetailsModel> books = List<BookDetailsModel>.from(
          serviceLocator.get<Box<BookDetailsModel>>().values);

      return (successful: true, errorString: null, books: books);
    } catch (e) {
      return (successful: false, errorString: e.toString(), books: null);
    }
  }

  @override
  Future<({String? errorString, bool successful})> removeBook(
      String bookId) async {
    try {
      await serviceLocator.get<Box<BookDetailsModel>>().delete(bookId);
      return (successful: true, errorString: null);
    } catch (e) {
      return (successful: false, errorString: e.toString());
    }
  }
}
