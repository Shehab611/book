import 'package:book/constants.dart';
import 'package:book/core/usable_functions/api_service_helper.dart';
import 'package:book/core/utils/failure.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:book/features/home/data/models/book_model.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

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
      statuesCode:e.response!.statusCode!,
      books: null,
      failure: ServerFailure.fromResponse(
          e.response!.statusCode!, e.response?.data)
      );
    }
  }

  List _getUserBookCategories()  {

  return serviceLocator.get<Box<UserDataModel>>().get(0)!.bookCategories;
  }

  @override
  Future<({List<
      BookModel>? books, Failure? failure, int statuesCode})> getRecommendedBooks() async{
   String bookCategories= _getUserBookCategories().join('-');

   try {
     var data = await DioServiceHelper.getData(endPoint: 'volumes', query: {
       'q': bookCategories,
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
     statuesCode:e.response!.statusCode!,
     books: null,
     failure: ServerFailure.fromResponse(
         e.response!.statusCode!, e.response?.data)
     );
   }
  }
}
