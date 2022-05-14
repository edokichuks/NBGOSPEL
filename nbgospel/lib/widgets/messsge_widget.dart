import 'package:flutter/material.dart';
import 'package:nbgospel/model/message_model.dart';
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
    final webParse = Uri.parse(widget.messageModel.webURl);
    if (await canLaunchUrl(webParse)) {
      if (!await launchUrl(
        webParse,
        mode: LaunchMode.inAppWebView,
      )) {
        //print('inner statement ');
      }

      // print('lauched url');
    } else {
      throw "Could not launch $webParse";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade900,
      leading: ImageIcon(
        AssetImage(widget.messageModel.imgURl),
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        widget.messageModel.message,
        style: const TextStyle(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.all(10),
      hoverColor: Colors.red,
      onTap: _lunchURl,
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.white,
      ),
    );
  }
}
