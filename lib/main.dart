import 'package:book/constants.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';


void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      title: 'Book App',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder()
        }),
        useMaterial3: true,primaryColor: kDefaultColor
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.kLoginScreen,
      routes: AppRouter.routes,

    );
  }
}
