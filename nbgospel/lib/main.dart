import 'package:flutter/material.dart';

import 'package:nbgospel/screen/on_boarding_screen.dart';
import 'package:nbgospel/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen = null;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

// This widget is the root of your application.

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _iconBool = true;
  //just change here to fasle and true everything works fine
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightMode = ThemeData.light();

  ThemeData _darkMode = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBgospel',
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkMode : _lightMode,

      //     ThemeData(
      //   primarySwatch: Colors.grey,
      // ),
      //  home: SplashScreen(),

      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboard' : 'splashScreen',
      routes: {
        'onboard': (_) => OnBoardingScreen(),
        'splashScreen': (_) => SplashScreen(),
      },
    );
  }
}
