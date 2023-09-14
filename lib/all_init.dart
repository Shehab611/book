import 'package:book/core/usable_functions/api_service_helper.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/home/data/models/book_details_model.dart';
import 'package:book/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllAppInit{
  static Future<bool> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookDetailsModelAdapter());
    Hive.registerAdapter(VolumeInfoAdapter());
    Hive.registerAdapter(ImageLinksAdapter());
    await Hive.openBox<BookDetailsModel>('books');
    await Hive.openBox('keep_login');
   return await Hive.box('keep_login').get('keep_login', defaultValue: false);
  }

  static void dioInit(){
    DioServiceHelper.init(url: 'https://www.googleapis.com/books/v1/');
  }

  static void serviceLocatorInit(){
    initServicesLocator();
  }

  static Future<void> firebaseInit()async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void removeStatusBar(){
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
  }
}