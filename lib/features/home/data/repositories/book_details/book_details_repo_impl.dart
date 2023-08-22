import 'package:book/constants.dart';
import 'package:book/core/usable_functions/api_service_helper.dart';
import 'package:book/core/utils/failure.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'book_details_repo.dart';

final class BookDetailsRepoImpl implements BookDetailsRepo {
  @override
  Future<({int statuesCode, BookDetailsModel? book, Failure? failure})>
  getBookDetails(String bookID) async {
    try {
      var data = await DioServiceHelper.getData(
          endPoint: 'volumes/$bookID', query: {'key': apiKey});
      BookDetailsModel book = BookDetailsModel.fromJson(data.data);
      return (statuesCode: data.statusCode!, book: book, failure: null);
    } on DioException catch (e) {
      return (
      statuesCode: e.response!.statusCode!,
      book: null,
      failure: ServerFailure.fromResponse(
          e.response!.statusCode!, e.response?.data)
      );
    }
  }

  @override
  Future<({String? errorString, bool successful})> saveBook(
      BookDetailsModel bookDetailsModel) async{
    try {
      await serviceLocator.get<Box<BookDetailsModel>>().add(bookDetailsModel);

      return (successful:true,errorString:null);
    }
    catch (e){

      return (successful:false,errorString:e.toString());
    }
  }
}
