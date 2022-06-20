import 'package:flutter/material.dart';
import 'package:nbgospel/model/model.dart';
import '../theme_app/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildListMessage extends StatefulWidget {
  final DrawerModel drawerModel;

  const BuildListMessage({
    Key? key,
    required this.drawerModel,
  }) : super(key: key);

  @override
  State<BuildListMessage> createState() => _BuildListMessageState();
}

class _BuildListMessageState extends State<BuildListMessage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SizedBox(
        height: 81.35,
        child: ListTile(
          onTap: _lunchURL,
          tileColor: themeNotifier.isDark
              ? Colors.grey.shade200
              : Colors.grey.shade900,
          leading: Icon(
            widget.drawerModel.icon,
            color: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade900,
          ),
          // hoverColor: themeNotifier.isDark
          //     ? Colors.grey.shade200
          //     : Colors.grey.shade900,
          title: Text(
            widget.drawerModel.text,
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

  _lunchURL() async {
    final webParse = Uri.parse(widget.drawerModel.url);
    if (await canLaunchUrl(webParse)) {
      if (!await launchUrl(
        webParse,
        mode: LaunchMode.inAppWebView,
      )) {}
    } else {
      throw "Could not launch $webParse";
    }
  }
}
