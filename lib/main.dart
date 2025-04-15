import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_manager.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/screens/creat_event.dart';
import 'package:todo/screens/register_screen.dart';
import 'package:todo/theme/dark_theme.dart';

import 'home/home_screen.dart';
import 'screens/introduction_screen.dart';
import 'screens/login_screen.dart';
import 'screens/onbording_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/light_theme.dart';
import 'theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp( ChangeNotifierProvider(
   create: (context) => MyProvider(),
   child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(),),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    BaseTheme lightTheme =LightTheme();
    BaseTheme darkTheme =DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        IntroductionScreen.routeName:(context)=>IntroductionScreen(),
        OnBoardingScreen.routeName:(context)=>OnBoardingScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        CreatEvent.routeName:(context)=>CreatEvent(),

      },
    );
  }
}

