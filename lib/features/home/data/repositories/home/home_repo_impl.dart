import 'package:book/constants.dart';
import 'package:book/core/usable_functions/api_service_helper.dart';
import 'package:book/core/utils/failure.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_model.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';

final class HomeRepoImpl implements HomeRepo {
  @override
  Future<({List<BookModel>? books, int statuesCode, Failure? failure})>
      getBooks() async {
    try {
      var data = await DioServiceHelper.getData(endPoint: 'volumes', query: {
        'q': 'all',
        'maxResults': 40,
        'orderBy': 'newest',
        'key': apiKey
      });
      List<BookModel> books = [];
      for (var item in data.data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return (statuesCode: data.statusCode!, books: books, failure: null);
    } on DioException catch (e) {
      return (
        statuesCode: e.response!.statusCode!,
        books: null,
        failure: ServerFailure.fromResponse(
            e.response!.statusCode!, e.response?.data)
      );
    }
  }

  Future<String> _getUserBookCategories() async {
    var data = await serviceLocator.get<Database>().rawQuery(
        'select bookCategories from users where userEmail = ?',
        [FirebaseAuth.instance.currentUser!.email!]);

    return (data[0]['bookCategories'] as String);
  }

  @override
  Future<({List<BookModel>? books, Failure? failure, int statuesCode})>
      getRecommendedBooks() async {
    String bookCategories = await _getUserBookCategories();

    try {
      var data = await DioServiceHelper.getData(endPoint: 'volumes', query: {
        'q': (bookCategories.isNotEmpty) ? bookCategories : 'all',
        'maxResults': 40,
        'orderBy': 'newest',
        if (bookCategories.isEmpty) 'startIndex': 150,
        'key': apiKey
      });
      List<BookModel> books = [];

      for (var item in data.data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return (statuesCode: data.statusCode!, books: books, failure: null);
    } on DioException catch (e) {
      return (
        statuesCode: e.response!.statusCode!,
        books: null,
        failure: ServerFailure.fromResponse(
            e.response!.statusCode!, e.response?.data)
      );
    }
  }
}
