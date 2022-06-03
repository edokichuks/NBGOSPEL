import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_home.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    upNext();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void upNext() {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => MainHome(),
        ),
      );
    });
  }

  late AnimationController controller;
  late Animation animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          // gradient: LinearGradient(
          //   colors: [Colors.grey, Colors.brown, Colors.deepOrange],
          //
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),

          // image: DecorationImage(
          //   image: AssetImage('assets/NBG logo.jpg'),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: controller,
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  'assets/NBG logo.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
