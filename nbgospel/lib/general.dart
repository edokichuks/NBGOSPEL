import 'package:flutter/material.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          title: const Text(
            'General',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: ListView(
          children: [
            buildList('Switch Mode', () {}, Icons.light_mode),
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
      Icons.radio_button_checked,
      color: Colors.white,
    ),
  );
}
