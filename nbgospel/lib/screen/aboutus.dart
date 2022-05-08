import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'About Us',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: ListView(
          children: [
            buildList('Join our Group', () {}, Icons.group_add),
            buildList('About Developer', () {}, Icons.info_outline_rounded),
            buildList('Privacy Policy', () {}, Icons.info)
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
  );
}
