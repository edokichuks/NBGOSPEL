import 'package:flutter/material.dart';
import '../theme_app/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_developers.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
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
                  : Colors.grey.shade800,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          hoverColor: themeNotifier.isDark
              ? Colors.grey.shade200
              : Colors.grey.shade800,
          onTap: click,
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
              'About Us',
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
              buildList('Join our Group', () async {
                final webParse =
                    Uri.parse('https://nbgospel.com/whatapp-group-links/');
                if (await canLaunchUrl(webParse)) {
                  if (!await launchUrl(
                    webParse,
                    mode: LaunchMode.inAppWebView,
                  )) {}
                } else {
                  throw "Could not launch $webParse";
                }
              }, Icons.group_add),
              buildList('About Developer', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AboutDevelopers()));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Center(
                //       child: Text(
                //         'Coming Soon',
                //         style: TextStyle(
                //           fontFamily: 'Signatra',
                //           fontSize: 25,
                //           color: Colors.amber,
                //         ),
                //       ),
                //     ),
                //     elevation: 50,
                //     duration: Duration(seconds: 1),
                //   ),
                // );
              }, Icons.info_outline_rounded),
              buildList('Privacy Policy', () async {
                final webParse =
                    Uri.parse('https://nbgospel.com/privacy-policy/');
                if (await canLaunchUrl(webParse)) {
                  if (!await launchUrl(
                    webParse,
                    mode: LaunchMode.inAppWebView,
                  )) {}
                } else {
                  throw "Could not launch $webParse";
                }
              }, Icons.info)
            ],
          ));
    });
  }
}
