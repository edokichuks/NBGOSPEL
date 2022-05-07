import 'package:flutter/material.dart';
import 'package:nbgospel/screen/splash_screen.dart';

void main() {
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
      home: SplashScreen(),
    );
  }
}
