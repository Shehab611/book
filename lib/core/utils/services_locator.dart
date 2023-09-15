import 'package:book/features/authentication/data/repositories/complete_profile/complete_profile_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:book/features/authentication/data/repositories/reset_password/reset_password_repo_impl.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/features/home/data/repositories/book_details/book_details_repo_impl.dart';
import 'package:book/features/home/data/repositories/drawer/drawer_repo_impl.dart';
import 'package:book/features/home/data/repositories/home/home_repo_impl.dart';
import 'package:book/features/home/data/repositories/saved_repo/saved_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initServicesLocator() async {
  serviceLocator.registerSingleton<LoginRepoImpl>(LoginRepoImpl());
  serviceLocator.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl());
  serviceLocator
      .registerSingleton<CompleteProfileRepoImpl>(CompleteProfileRepoImpl());
  serviceLocator.registerSingleton<ResetPasswordImpl>(ResetPasswordImpl());
  serviceLocator.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  serviceLocator.registerSingleton<DrawerRepoImpl>(DrawerRepoImpl());
  serviceLocator.registerSingleton<BookDetailsRepoImpl>(BookDetailsRepoImpl());
  serviceLocator.registerSingleton<SavedRepoImpl>(SavedRepoImpl());
  serviceLocator.registerSingleton<Database>(
    await openDatabase(
      'userData.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE users (userEmail text Primary Key, fName text, lName text, imageLink text, birthDate text,gender text, bookCategories text );');
      },
    ),
  );
  serviceLocator.registerSingleton<Box<BookDetailsModel>>(Hive.box('books'));
}
