import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nbgospel/screen/on_boarding_screen.dart';
import 'package:nbgospel/screen/splash_screen.dart';
import 'package:nbgospel/ui/global/theme/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen = null;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBgospel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

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
