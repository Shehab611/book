import 'package:book/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'all_init.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/services_locator.dart';
import 'features/authentication/data/models/user_data.dart';
import 'features/home/data/models/book_details_model.dart';

late bool value;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  value = await AllAppInit.initHive();
  AllAppInit.dioInit();
  AllAppInit.serviceLocatorInit();
  await AllAppInit.firebaseInit();
  AllAppInit.removeStatusBar();
print(serviceLocator.get<Box<UserDataModel>>().values);
print(serviceLocator.get<Box<BookDetailsModel>>().values);

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
