part of 'register_cubit.dart';


abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class GoToLoginScreen extends RegisterState {}
class SignUpWithGoogle extends RegisterState {
  SignUpWithGoogle({required this.data});
  final ({String? errorString, bool succsuful}) data;

}