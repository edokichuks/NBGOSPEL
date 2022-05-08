
import 'package:flutter/material.dart';
import 'package:nbgospel/screen/message.dart';
import 'package:nbgospel/screen/settings.dart';

class NavigatorBarPage extends StatefulWidget {
  const NavigatorBarPage({Key? key}) : super(key: key);

  @override
  _NavigatorBarPageState createState() => _NavigatorBarPageState();
}

class _NavigatorBarPageState extends State<NavigatorBarPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
            body: ListView(
      children: [
        Container(
          child: Image.asset('#'),
          //to add the logo for the nbgospel
          height: 150,
        ),
        Container(
          color: Colors.black,
          child: Column(
            children: [
              buildListTile('Christain Articles', Icons.article, () {}),
              buildListTile('Christain News', Icons.new_releases_sharp, () {}),
              buildListTile('Christain Messages', Icons.message_outlined, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Message()));
              }),
              buildListTile('Biography', Icons.account_box_outlined, () {}),
              buildListTile(
                  'Online Live Sermon', Icons.account_box_outlined, () {}),
              buildListTile('LATEST SERMONS', Icons.new_releases, () {}),
              const Divider(
                height: 0.5,
                color: Colors.white,
              ),
              buildListTile('Settings', Icons.settings, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Settings(),
                    ));
              }),
              buildListTile('Exit', Icons.logout, () {
                Navigator.pop(context);
              }),
            ],
          ),
        )
      ],
    )));
  }

  Widget buildListTile(String text, IconData icon, VoidCallback click) {
    return SizedBox(
      height: 81.35,
      child: ListTile(
        onTap: click,
        tileColor: Colors.black,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        hoverColor: Colors.grey,
        title: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
