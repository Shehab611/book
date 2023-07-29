import 'package:book/core/utils/app_router.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  static RegisterCubit get(context) => BlocProvider.of(context);


  void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      AppRouter.kLoginScreen,
    );
    emit(GoToLoginScreen());
  }

  void signUpWithGoogle() async{
    ({String? errorString, bool succsuful}) data = await registerRepo.signUPWithGoogle();
    emit(SignUpWithGoogle(data: data));
  }
}
