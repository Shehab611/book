part of 'register_cubit.dart';


sealed class RegisterState {}

class RegisterInitial extends RegisterState {}
class GoToLoginScreen extends RegisterState {}
class GoToVerificationScreen extends RegisterState {}
class GoToCompleteProfileScreen extends RegisterState {}
class GoToCompleteProfileScreenWithGoogle extends RegisterState {}
class SignUpWithGoogle extends RegisterState {
  SignUpWithGoogle({required this.data});
  final ({String? errorString, bool succsuful}) data;

}
class UserRegister extends RegisterState{
  UserRegister({required this.data});
  final ({String? errorString, bool succsuful}) data;

}
class VerifyUserEmail extends RegisterState{
  VerifyUserEmail({required this.data});
  final ({String? errorString, bool succsuful}) data;
}