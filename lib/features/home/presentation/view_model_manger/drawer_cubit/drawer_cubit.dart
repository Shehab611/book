import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerInitial());
  bool? value;

  static DrawerCubit get(context) => BlocProvider.of(context);

  void getValue() async {
    var data = await serviceLocator.get<Database>().rawQuery(
        'select keepLoggedIn from users where userEmail = ?',
        [FirebaseAuth.instance.currentUser!.email!]);
    if ((data[0]['keepLoggedIn'] as int) == 0) {
      value = false;
    } else {
      value = true;
    }
    emit(DrawerValueGet());
  }

  void changeLoggedInValue(bool value) async {
    if (value) {
      this.value = value;
      await serviceLocator.get<Database>().rawUpdate(
          'update users set keepLoggedIn = ? where userEmail =?',
          [1, FirebaseAuth.instance.currentUser!.email!]);
      emit(DrawerMakeLoggedInTrue());
    } else {
      this.value = value;
      await serviceLocator.get<Database>().rawUpdate(
          'update users set keepLoggedIn = ? where userEmail =?',
          [0, FirebaseAuth.instance.currentUser!.email!]);
      emit(DrawerMakeLoggedInFalse());
    }
  }

  void navigateToHome(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name == AppPathName.kHomeScreen) {
      emit(DrawerHomePop());
      Navigator.pop(context);
    } else {
      emit(DrawerNavigateToHome());
      AppNavigator.navigateToHomeScreen(context);
    }
  }

  void navigateToSaved(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name == AppPathName.kSavedScreen) {
      emit(DrawerSavedPop());
      Navigator.pop(context);
    } else {
      emit(DrawerNavigateToSaved());
      AppNavigator.navigateToSavedScreen(context);
    }
  }

  Future<void> logOut(BuildContext context) async {
    await serviceLocator.get<Box<BookDetailsModel>>().clear().then((value) {
      FirebaseAuth.instance.signOut();
      GoogleSignIn().disconnect();
      emit(DrawerLogOut());
      AppNavigator.navigateToLoginScreen(context);
    });
  }
}
