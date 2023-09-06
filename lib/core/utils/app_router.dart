import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/repositories/complete_profile/complete_profile_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/reset_password/reset_password_repo_impl.dart';
import 'package:book/features/authentication/presentation/view_model_manger/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:book/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';
import 'package:book/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:book/features/authentication/presentation/view_model_manger/reset_password_cubit/reset_password_cubit.dart';
import 'package:book/features/authentication/presentation/views/complete_profile_screen.dart';
import 'package:book/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:book/features/authentication/presentation/views/login_screen.dart';
import 'package:book/features/authentication/presentation/views/register_screen.dart';
import 'package:book/features/authentication/presentation/views/verification_screen.dart';
import 'package:book/features/home/data/repositories/home/home_repo_impl.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo_impl.dart';
import 'package:book/features/home/presentation/view_model_manger/books_cubit/books_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/home_cubit/home_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/recommended_books_cubit/recommended_books_cubit.dart';
import 'package:book/features/home/presentation/view_model_manger/saved_screen_cubit/saved_screen_cubit.dart';
import 'package:book/features/home/presentation/views/book_details_screen.dart';
import 'package:book/features/home/presentation/views/home_screen.dart';
import 'package:book/features/home/presentation/views/saved_screen.dart';
import 'package:book/features/home/presentation/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kLoginScreen: (BuildContext context) => BlocProvider(
        create: (BuildContext context) =>
            LoginCubit(serviceLocator.get<LoginRepoImpl>()),
        child: const LoginScreen()),
    AppPathName.kForgetPasswordScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              ResetPasswordCubit(serviceLocator.get<ResetPasswordImpl>()),
          child: const ForgetPasswordScreen(),
        ),
    AppPathName.kRegisterScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              RegisterCubit(serviceLocator.get<RegisterRepoImpl>()),
          child: const RegisterScreen(),
        ),
    AppPathName.kVerificationScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              RegisterCubit(serviceLocator.get<RegisterRepoImpl>()),
          child: const VerificationScreen(),
        ),
    AppPathName.kCompleteProfile: (BuildContext context) => BlocProvider(
          create: (context) => CompleteProfileCubit(
              serviceLocator.get<CompleteProfileRepoImpl>())
            ..putData(),
          child: const CompleteProfileScreen(),
        ),
    AppPathName.kHomeScreen: (BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  HomeCubit(serviceLocator.get<HomeRepoImpl>())..check(),
            ),
            BlocProvider(
              create: (context) =>
                  BooksCubit(serviceLocator.get<HomeRepoImpl>())..getBooks(),
            ),
            BlocProvider(
              create: (context) =>
                  RecommendedBooksCubit(serviceLocator.get<HomeRepoImpl>())
                    ..getRecommendedBooks(),
            ),
          ],
          child: const HomeScreen(),
        ),
    AppPathName.kSearchScreen: (BuildContext context) => const SearchScreen(),
    AppPathName.kBookDetailsScreen: (BuildContext context) =>
        const BookDetailsScreen(),
    AppPathName.kSavedScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              SavedScreenCubit(serviceLocator.get<SavedRepoImpl>())
                ..getAllBooks(),
          child: const SavedScreen(),
        ),
  };
}
abstract final class AppNavigator {
  static navigateToRegisterScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kRegisterScreen,
      );

  static navigateToLoginScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kLoginScreen,
      );

  static navigateToCompleteProfileScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kCompleteProfile,
      );

  static navigateToVerificationScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kVerificationScreen,
      );

  static navigateToForgetPasswordScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kForgetPasswordScreen,
      );

  static navigateToHomeScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kHomeScreen,

      );

  static navigateToSearchScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kSearchScreen,
      );

  static navigateToBookDetailsScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kBookDetailsScreen,
      );

  static navigateToSavedScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kSavedScreen,
      );
}

abstract final class AppPathName {
  static const String kLoginScreen = '/LoginScreen';
  static const String kRegisterScreen = '/RegisterScreen';
  static const String kCompleteProfile = '/CompleteProfile';
  static const String kVerificationScreen = '/VerificationScreen';
  static const String kForgetPasswordScreen = '/ForgetPasswordScreen';
  static const String kHomeScreen = '/HomeScreen';
  static const String kSearchScreen = '/SearchScreen';
  static const String kBookDetailsScreen = '/BookDetailsScreen';
  static const String kSavedScreen = '/SavedScreen';
}
