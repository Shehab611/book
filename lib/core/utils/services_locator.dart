import 'package:book/features/authentication/data/repositories/complete_profile/complete_profile_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/reset_password/reset_password_repo_impl.dart';
import 'package:get_it/get_it.dart';



final GetIt serviceLocator = GetIt.instance;

void initServicesLocator() {

  serviceLocator.registerSingleton<LoginRepoImpl>(LoginRepoImpl());
  serviceLocator.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl());
  serviceLocator.registerSingleton<CompleteProfileRepoImpl>(CompleteProfileRepoImpl());
  serviceLocator.registerSingleton<ResetPasswordImpl>(ResetPasswordImpl());


}