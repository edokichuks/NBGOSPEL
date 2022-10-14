import 'package:flutter/material.dart';
import 'package:nbgospel/screen/on_boarding_screen.dart';
import 'package:nbgospel/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:native_notify/native_notify.dart';
import 'theme_app/theme_model.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  NativeNotify.initialize(
      1271,
      'NPXdYp6ZFmlW3eNrb2Gfs2',
      'AAAA7ruT1iE:APA91bEiKajZ4N-SIC_YiCdBWe1u5UANNitLhszRYuafTsfhc5BlX8T2LRKiDFor5xpehyYNsxcKEr4btoq7cs83Jo2bR_3n4Op2ntzoDAnujDx7VjVlY_ikcmGK_pBL75_INSQ8e1s7',
      null);
  await preferences.setInt('initScreen', 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'NBGospel',
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDark
                ? ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.light(
                        primary: Colors.grey, secondary: Colors.transparent),
                  )
                : ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light(
                        primary: Colors.deepOrange,
                        secondary: Colors.transparent),
                  ),
            initialRoute: initScreen == 0 || initScreen == null
                ? 'onboard'
                : 'splashScreen',
            routes: {
              'onboard': (_) => const OnBoardingScreen(),
              'splashScreen': (_) => const SplashScreen(),
            },
          );
        },
      ),
    );
  }
}
