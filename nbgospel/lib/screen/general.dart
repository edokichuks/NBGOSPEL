import 'package:flutter/material.dart';
import '../theme_app/theme_app.dart';
import 'package:provider/provider.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? Colors.grey.shade900 : Colors.grey.shade200,
        appBar: AppBar(
          leading: BackButton(
            color: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade900,
          ),
          title: Text(
            'General',
            style: TextStyle(
              color: themeNotifier.isDark
                  ? Colors.grey.shade200
                  : Colors.grey.shade900,
            ),
          ),
          centerTitle: false,
          backgroundColor: themeNotifier.isDark
              ? Colors.grey.shade900
              : Colors.grey.shade200,
          elevation: 4,
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.light_mode,
                color: themeNotifier.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade900,
              ),
              title: Text(
                'Switch Theme',
                style: TextStyle(
                  color: themeNotifier.isDark
                      ? Colors.grey.shade200
                      : Colors.grey.shade900,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              hoverColor: Colors.grey,
              onTap: () {
                themeNotifier.isDark = !themeNotifier.isDark;
              },
              trailing: Icon(
                Icons.radio_button_checked,
                color: themeNotifier.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade900,
              ),
            ),
          ],
        ),
      );
    });
  }
}
