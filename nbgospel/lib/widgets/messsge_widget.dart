import 'package:flutter/material.dart';
import 'package:nbgospel/model/message_model.dart';
import 'package:nbgospel/theme_app/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageBox extends StatefulWidget {
  final MessageModel messageModel;
  const MessageBox({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  Future<void> _lunchURl() async {
    final webParse = Uri.parse('widget.messageModel.webURl');
    if (await canLaunchUrl(webParse)) {
      if (!await launchUrl(
        webParse,
        mode: LaunchMode.inAppWebView,
      )) {}
    } else {
      throw "Could not launch $webParse";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return ListTile(
        tileColor:
            themeNotifier.isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        leading: ImageIcon(
          AssetImage(widget.messageModel.imgURl),
          size: 30,
          color: themeNotifier.isDark
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
        title: Text(
          widget.messageModel.message,
          style: TextStyle(
            color: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade800,
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        hoverColor:
            themeNotifier.isDark ? Colors.grey.shade200 : Colors.grey.shade800,
        onTap: _lunchURl,
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: themeNotifier.isDark
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
      );
    });
  }
}
