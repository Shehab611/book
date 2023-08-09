import 'package:book/constants.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:book/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';

late bool value;
void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServicesLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,);
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   String initRoute=switch(value){
     true=>AppRouter.kHomeScreen,
     false=>AppRouter.kLoginScreen
   };
    return MaterialApp(
      title: 'Book App',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder()
        }),
        useMaterial3: true,primaryColor: kDefaultColor
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initRoute,
      routes: AppRouter.routes,
    );
  }
}

Future<void>initHive()async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataModelAdapter());
  await Hive.openBox<UserDataModel>('user');
  await Hive.openBox('keep_login');
  value = await Hive.box('keep_login').get('keep_login',defaultValue: true);
}