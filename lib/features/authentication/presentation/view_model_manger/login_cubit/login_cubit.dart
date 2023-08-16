import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  @override
  Future<void> close() {
    passwordController.dispose();
    emailController.dispose();
    return super.close();
  }
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void goToRegister(BuildContext context) {
    emit(GoToRegisterScreen());
    Navigator.pushReplacementNamed(
      context,
      AppRouter.kRegisterScreen,
    );

  }

  void signInWithGoogle() async {
    ({String? errorString, bool succsuful}) data =
        await loginRepo.signUPWithGoogle();
    emit(LoginWithGoogle(data: data));
  }

  void navigateToForgetPassword(BuildContext context) {
    emit(GoToForgetPasswordScreen());
    Navigator.pushNamed(context, AppRouter.kForgetPasswordScreen);

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
    Navigator.pushNamed(context, AppRouter.kHomeScreen);

  }

  void navigateToCompleteProfile(BuildContext context) {
    emit(GoToCompleteProfileScreen());
    Navigator.pushNamed(context, AppRouter.kCompleteProfile);

  }
}
