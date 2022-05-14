import 'package:flutter/material.dart';
import 'package:nbgospel/model/model.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildListMessage extends StatefulWidget {
  final DrawerModel drawerModel;

  BuildListMessage({
    required this.drawerModel,
  });

  @override
  State<BuildListMessage> createState() => _BuildListMessageState();
}

class _BuildListMessageState extends State<BuildListMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81.35,
      child: ListTile(
        onTap: _lunchURL,
        tileColor: Colors.grey.shade900,
        leading: Icon(
          widget.drawerModel.icon,
          color: Colors.white,
        ),
        hoverColor: Colors.grey,
        title: Text(
          widget.drawerModel.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
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
