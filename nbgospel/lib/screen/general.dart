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
          buildList('Switch Mode', () {
            // Navigate to the PreferencePage
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => PreferencePage(),
            // ));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Coming Soon'),
                backgroundColor: Colors.grey,
              ),
            );
          }, Icons.light_mode),
        ],
      ),
    );
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
    hoverColor: Colors.grey,
    onTap: click,
    trailing: const Icon(
      Icons.radio_button_checked,
      color: Colors.white,
    ),
  );
}
