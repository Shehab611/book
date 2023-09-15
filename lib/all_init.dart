import 'package:book/core/usable_functions/api_service_helper.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sqflite/sqflite.dart';

class AllAppInit {
  static Future<bool> keepLoggedIn() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    else {
      var data=await serviceLocator.get<Database>().rawQuery(
          'select keepLoggedIn from users where userEmail = ?',
          [FirebaseAuth.instance.currentUser!.email!]);

      if((data[0]['keepLoggedIn'] as int) == 0) {
        return false;
      }
      return true;

    }

  }


  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookDetailsModelAdapter());
    Hive.registerAdapter(VolumeInfoAdapter());
    Hive.registerAdapter(ImageLinksAdapter());
    await Hive.openBox<BookDetailsModel>('books');
  }

  static void dioInit() {
    DioServiceHelper.init(url: 'https://www.googleapis.com/books/v1/');
  }

  static Future<void> serviceLocatorInit() async {
    await initServicesLocator();
  }

  static Future<void> firebaseInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void removeStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
  }
}