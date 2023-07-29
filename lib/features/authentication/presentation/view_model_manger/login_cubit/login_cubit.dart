import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  static LoginCubit get(context) => BlocProvider.of(context);


  void goToRegister(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      AppRouter.kRegisterScreen,
    );
    emit(GoToRegisterScreen());
  }

  void signInWithGoogle() async{
    ({String? errorString, bool succsuful}) data =await loginRepo.signUPWithGoogle();
    emit(LoginWithGoogle(data: data));
  }



}
