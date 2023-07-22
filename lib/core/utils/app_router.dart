import 'package:book/features/authentication/presentation/views/login_screen.dart';
import 'package:book/features/authentication/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';


abstract class AppRouter {
  static const String kLoginScreen = '/LoginScreen';
  static const String kRegisterScreen = '/RegisterScreen';

  static final Map<String,WidgetBuilder> routes={
    kLoginScreen:(context)=>const LoginScreen(),
    kRegisterScreen:(context)=> const RegisterScreen()
  };
}
