part of 'login_cubit.dart';


sealed class LoginState {}

class LoginInitial extends LoginState {}
class GoToRegisterScreen extends LoginState {}
class GoToCompleteProfileScreen extends LoginState {}
class GoToHomeScreen extends LoginState {}
class LoginWithGoogle extends LoginState {
  LoginWithGoogle({required this.data});
  final ({String? errorString, bool succsuful}) data;
}
class GoToForgetPasswordScreen extends LoginState {}
class UserLogin extends LoginState {
  UserLogin({required this.data});
  final ({String? errorString, bool succsuful}) data;
}
class IfUserExits extends LoginState {
  IfUserExits({required this.data});
  final ({String? errorString, bool exits, bool succsuful}) data;
}