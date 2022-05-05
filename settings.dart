import 'package:nbgospel/aboutus.dart';
import 'package:nbgospel/general.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
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
    tileColor: Colors.black,
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    contentPadding: const EdgeInsets.all(10),
    hoverColor: Colors.grey,
    onTap: click,
    trailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      color: Colors.white,
    ),
  );
}
