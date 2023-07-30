part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}
class SendResetPassword extends ResetPasswordState {
  SendResetPassword({required this.data});
  final ({String? errorString, bool succsuful}) data;
}
class NavigateToLogin extends ResetPasswordState {}
