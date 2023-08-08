import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void goToRegister(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      AppRouter.kRegisterScreen,
    );
    emit(GoToRegisterScreen());
  }

  void signInWithGoogle() async {
    ({String? errorString, bool succsuful}) data =
        await loginRepo.signUPWithGoogle();
    emit(LoginWithGoogle(data: data));
  }

  void navigateToForgetPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.kForgetPasswordScreen);
    emit(GoToForgetPasswordScreen());
  }

  void userLogin(BuildContext context) async {
    if (LoginCubit.get(context).formKey.currentState!.validate()) {
      ({String? errorString, bool succsuful}) data = await loginRepo
          .userLogin(user: (emailController.text, passwordController.text));
      emit(UserLogin(data: data));
      // todo :: navigate to home page
    }
  }

  void ifUserExits() async {
    FirebaseAuth.instance.currentUser!.reload();
    ({String? errorString, bool exits, bool succsuful}) data = await loginRepo
        .checkIfUserExits(FirebaseAuth.instance.currentUser!.email!);
    emit(IfUserExits(data: data));
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.kHomeScreen);
    emit(GoToHomeScreen());
  }

  void navigateToCompleteProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.kCompleteProfile);
    emit(GoToCompleteProfileScreen());
  }
}
