import 'package:book/core/usable_functions/firebase_data.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);

  void navigateToSearchScreen(BuildContext context) {
    emit(const NavigateToSearchScreen());
    AppNavigator.navigateToSearchScreen(context);
  }

  void check() async {
    if (serviceLocator
        .get<Box<UserDataModel>>()
        .isEmpty) {
      var userData = await DataHandling.getDataFromDoc(
          collectionName: 'users',
          docName: FirebaseAuth.instance.currentUser!.email!);
      var userDataModel = UserDataModel.fromJson(userData.data()!);
      await serviceLocator.get<Box<UserDataModel>>().add(userDataModel);

      var favouriteBooks = await DataHandling.getDataFromAllDocsInSubCollection(
          collectionName: 'users',
          docName: FirebaseAuth.instance.currentUser!.email!,
          subCollectionName: 'favourites');
        var books= favouriteBooks.map((e) =>BookDetailsModel.fromJson(e)).toList();

        for (var item in books){
          await serviceLocator.get<Box<BookDetailsModel>>().put(item.id, item);
        }
        emit(const CheckOnData());
    }
  }
}
