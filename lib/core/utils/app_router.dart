import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:book/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';
import 'package:book/features/authentication/presentation/views/complete_profile_screen.dart';
import 'package:book/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:book/features/authentication/presentation/views/login_screen.dart';
import 'package:book/features/authentication/presentation/views/register_screen.dart';
import 'package:book/features/authentication/presentation/views/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
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
    kRegisterScreen: (BuildContext context) => const RegisterScreen(),
    kCompleteProfile: (BuildContext context) => const CompleteProfileScreen(),
    kVerificationScreen: (BuildContext context) => const VerificationScreen(),
    kForgetPasswordScreen: (BuildContext context) =>
        const ForgetPasswordScreen(),
  };
}
