import 'package:flutter/material.dart';

import 'aboutus.dart';
import 'general.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey.shade800,
          elevation: 0,
        ),
        body: ListView(
          children: [
            buildList('General', () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => General()));
            }, Icons.book),
            buildList('About Us', () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            }, Icons.info)
          ],
        ));
  }
}

Widget buildList(String text, VoidCallback click, IconData icon) {
  return ListTile(
    tileColor: Colors.grey.shade900,
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    contentPadding: const EdgeInsets.all(10),
    hoverColor: Colors.grey.shade300,
    onTap: click,
    trailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color: Colors.white,
    ),
  );
}
