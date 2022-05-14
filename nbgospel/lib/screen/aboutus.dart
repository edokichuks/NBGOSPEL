import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: const Text(
            'About Us',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.grey.shade800,
          elevation: 0,
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(
                        fontFamily: 'Signatra',
                        fontSize: 25,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  elevation: 50,
                  duration: Duration(seconds: 1),
                ),
              );
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
    hoverColor: Colors.grey.shade200,
    onTap: click,
  );
}
