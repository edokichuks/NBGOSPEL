import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_app/theme_app.dart';
import 'screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) {
        Widget buildList(String text, VoidCallback click, IconData icon) {
          return ListTile(
            leading: Icon(
              icon,
              color: themeNotifier.isDark
                  ? Colors.grey.shade200
                  : Colors.grey.shade800,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: themeNotifier.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade900,
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            hoverColor: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade900,
            onTap: click,
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: themeNotifier.isDark
                  ? Colors.grey.shade200
                  : Colors.grey.shade900,
            ),
          );
        }

        return Scaffold(
            backgroundColor: themeNotifier.isDark
                ? Colors.grey.shade900
                : Colors.grey.shade200,
            appBar: AppBar(
              leading: BackButton(
                color: themeNotifier.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade900,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: themeNotifier.isDark
                      ? Colors.grey.shade200
                      : Colors.grey.shade900,
                ),
              ),
              backgroundColor: themeNotifier.isDark
                  ? Colors.grey.shade900
                  : Colors.grey.shade200,
              elevation: 4,
            ),
            body: ListView(
              children: [
                buildList('General', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const General()));
                }, Icons.book),
                buildList('About Us', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                }, Icons.info)
              ],
            ));
      },
    );
  }
}
