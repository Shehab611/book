import 'package:book/core/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerInitial());
  bool? value;

  static DrawerCubit get(context) => BlocProvider.of(context);

  void getValue() async {
    value = await Hive.box('keep_login').get('keep_login', defaultValue: false);
    emit(DrawerValueGet());
  }

  void changeLoggedInValue(bool value) async {
    this.value = await Hive.box('keep_login').get('keep_login');
    if (value) {
      this.value = value;
      await Hive.box('keep_login').put('keep_login', value);
      emit(DrawerMakeLoggedInTrue());
    } else {
      this.value = value;
      await Hive.box('keep_login').put('keep_login', value);
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

  void logOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
    emit(DrawerLogOut());
    AppNavigator.navigateToLoginScreen(context);
  }
}
