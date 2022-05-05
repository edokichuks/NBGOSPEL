import 'package:flutter/material.dart';

import 'navigatorbar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NBHomePage(),
  ));
}

class NBHomePage extends StatefulWidget {
  const NBHomePage({Key? key}) : super(key: key);

  @override
  State<NBHomePage> createState() => _NBHomePageState();
}

class _NBHomePageState extends State<NBHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: const Text('NBGOSPEL'),
      ),
      drawer: NavigatorBarPage(),
      body: Center(child: Image.asset('assets/holy.png',),),
    );
  }
}
