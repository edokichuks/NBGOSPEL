import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nbgospel/drawer_data.dart';
import '../theme_app/theme_app.dart';
import 'package:nbgospel/widgets/widgets.dart';
import 'package:nbgospel/screen/settings.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Drawer(
        child: Scaffold(
          backgroundColor: themeNotifier.isDark
              ? Colors.grey.shade900
              : Colors.grey.shade200,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/nbgospel.jpg',
                  fit: BoxFit.fill,
                ),
                height: 150,
              ),
              Container(
                color: themeNotifier.isDark
                    ? Colors.grey.shade900
                    : Colors.grey.shade200,
                child: Column(
                  children: [
                    BuildListMessage(
                      drawerModel: drawerData[0],
                    ),
                    BuildListMessage(
                      drawerModel: drawerData[1],
                    ),
                    BuildListMessage(
                      drawerModel: drawerData[2],
                    ),
                    BuildListMessage(
                      drawerModel: drawerData[3],
                    ),
                    BuildListMessage(
                      drawerModel: drawerData[4],
                    ),
                    BuildListMessage(
                      drawerModel: drawerData[5],
                    ),
                  ],
                ),
              ),
              buildListTile(
                'Christan Messages',
                Icons.message_outlined,
                () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Message()));
                },
              ),
              Divider(
                height: 0.5,
                thickness: 2,
                color: themeNotifier.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade900,
              ),
              buildListTile('Settings', Icons.settings, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Settings(),
                  ),
                );
              }),
              WillPopScope(
                onWillPop: () => _onExistApp(context),
                child: buildListTile(
                  'Exit',
                  Icons.logout,
                  () {
                    //  Navigator.pop(context);
                    _onExistApp(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildListTile(String text, IconData icon, VoidCallback click) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return SizedBox(
        height: 81.35,
        child: ListTile(
          onTap: click,
          tileColor: themeNotifier.isDark
              ? Colors.grey.shade900
              : Colors.grey.shade200,
          leading: Icon(
            icon,
            color: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade900,
          ),
          hoverColor: themeNotifier.isDark
              ? Colors.grey.shade200
              : Colors.grey.shade900,
          title: Text(
            text,
            style: TextStyle(
              color: themeNotifier.isDark
                  ? Colors.grey.shade200
                  : Colors.grey.shade900,
            ),
          ),
        ),
      );
    });
  }

  Future<bool> _onExistApp(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do want to exit from nbGospel?'),
              actions: [
                FlatButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('EXIT'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('CANCEL'),
                ),
              ],
            ));

    return exitApp ? false : true;
  }
}
