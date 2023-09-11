import 'package:book/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_init.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';

late bool value;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  value = await AllAppInit.initHive();
  AllAppInit.dioInit();
  AllAppInit.serviceLocatorInit();
  await AllAppInit.firebaseInit();
  AllAppInit.removeStatusBar();

  /* runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String initRoute = switch (value) {
      true => AppPathName.kHomeScreen,
      false => AppPathName.kLoginScreen
    };
    return MaterialApp(
      title: 'Book App',
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder()
          }),
          useMaterial3: true,
          primaryColor: kColor),
      debugShowCheckedModeBanner: false,
      initialRoute: initRoute,
      routes: AppRouter.routes,
    );
  }
}
