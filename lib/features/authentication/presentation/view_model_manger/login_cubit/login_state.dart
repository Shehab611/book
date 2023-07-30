part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class GoToRegisterScreen extends LoginState {}
class LoginWithGoogle extends LoginState {
  LoginWithGoogle({required this.data});
  final ({String? errorString, bool succsuful}) data;
}
class GoToForgetPasswordScreen extends LoginState {}
class UserLogin extends LoginState {
  UserLogin({required this.data});
  final ({String? errorString, bool succsuful}) data;
}