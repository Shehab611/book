import 'package:book/features/authentication/presentation/views/complete_profile.dart';
import 'package:book/features/authentication/presentation/views/login_screen.dart';
import 'package:book/features/authentication/presentation/views/register_screen.dart';
import 'package:book/features/authentication/presentation/views/verification_screen.dart';
import 'package:flutter/material.dart';


abstract class AppRouter {
  static const String kLoginScreen = '/LoginScreen';
  static const String kRegisterScreen = '/RegisterScreen';
  static const String kCompleteProfile = '/CompleteProfile';
  static const String kVerificationScreen = '/VerificationScreen';

  static final Map<String,WidgetBuilder> routes={
    kLoginScreen:(BuildContext context)=>const LoginScreen(),
    kRegisterScreen:(BuildContext context)=> const RegisterScreen(),
    kCompleteProfile:(BuildContext context)=>const CompleteProfileScreen(),
    kVerificationScreen:(BuildContext context)=>const VerificationScreen(),
  };
}
