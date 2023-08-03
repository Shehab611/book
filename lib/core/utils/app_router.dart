import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/reset_password/reset_password_repo_impl.dart';
import 'package:book/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';
import 'package:book/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:book/features/authentication/presentation/view_model_manger/reset_password_cubit/reset_password_cubit.dart';
import 'package:book/features/authentication/presentation/views/complete_profile_screen.dart';
import 'package:book/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:book/features/authentication/presentation/views/login_screen.dart';
import 'package:book/features/authentication/presentation/views/register_screen.dart';
import 'package:book/features/authentication/presentation/views/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 abstract final class AppRouter {
  static const String kLoginScreen = '/LoginScreen';
  static const String kRegisterScreen = '/RegisterScreen';
  static const String kCompleteProfile = '/CompleteProfile';
  static const String kVerificationScreen = '/VerificationScreen';
  static const String kForgetPasswordScreen = '/ForgetPasswordScreen';

  static final Map<String, WidgetBuilder> routes = {
    kLoginScreen: (BuildContext context) => BlocProvider(
        create: (BuildContext context) =>
            LoginCubit(serviceLocator.get<LoginRepoImpl>()),
        child: const LoginScreen()),
    kForgetPasswordScreen: (BuildContext context) => BlocProvider(
      create: (context) =>
          ResetPasswordCubit(serviceLocator.get<ResetPasswordImpl>()),
      child: const ForgetPasswordScreen(),
    ),
    kRegisterScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              RegisterCubit(serviceLocator.get<RegisterRepoImpl>()),
          child: const RegisterScreen(),
        ),
    kVerificationScreen: (BuildContext context) =>BlocProvider(
      create: (context) =>
          RegisterCubit(serviceLocator.get<RegisterRepoImpl>()),
      child: const VerificationScreen(),
    ),
    kCompleteProfile: (BuildContext context) => const CompleteProfileScreen(),

  };
}
