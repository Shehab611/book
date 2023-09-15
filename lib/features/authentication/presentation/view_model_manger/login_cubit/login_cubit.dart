import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final LoginRepo loginRepo=LoginRepoImpl();
  @override
  Future<void> close() async{
    passwordController.dispose();
    emailController.dispose();
    return await super.close();
  }
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void goToRegister(BuildContext context) {
    emit(GoToRegisterScreen());
   AppNavigator.navigateToRegisterScreen(context);

  }

  void signInWithGoogle() async {
    ({String? errorString, bool succsuful}) data =
    await loginRepo.signUPWithGoogle();
    emit(LoginWithGoogle(data: data));
  }

  void navigateToForgetPassword(BuildContext context) {
    emit(GoToForgetPasswordScreen());
    AppNavigator.navigateToForgetPasswordScreen(context);

  }

  void userLogin(BuildContext context) async {
    if (LoginCubit.get(context).formKey.currentState!.validate()) {
      ({String? errorString, bool succsuful}) data = await loginRepo
          .userLogin(user: (emailController.text, passwordController.text));
      emit(UserLogin(data: data));
    }
  }

  void ifUserExits() async {
    FirebaseAuth.instance.currentUser!.reload();
    ({String? errorString, bool exits, bool succsuful}) data = await loginRepo
        .checkIfUserExits(FirebaseAuth.instance.currentUser!.email!);
    emit(IfUserExits(data: data));
  }

  void navigateToHome(BuildContext context) {
    emit(GoToHomeScreen());
  AppNavigator.navigateToHomeScreen(context);

  }

  void navigateToCompleteProfile(BuildContext context) {
    emit(GoToCompleteProfileScreen());
   AppNavigator.navigateToCompleteProfileScreen(context);

  }

}