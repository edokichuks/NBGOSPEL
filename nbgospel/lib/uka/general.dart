import 'package:flutter/material.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  bool _iconBool = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightMode = ThemeData.light();

  ThemeData _darkMode = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          title: const Text(
            'General',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.grey.shade800,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Switch Mode',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _iconBool = !_iconBool;
                      });
                    },
                    color: Colors.white,
                    icon: Icon(_iconBool ? _iconLight : _iconDark)),
              ],
            )
          ],
        ));
  }
}
