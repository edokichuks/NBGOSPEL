import 'package:flutter/material.dart';
import 'package:nbgospel/message_list.dart';
import 'package:nbgospel/theme_app/theme_model.dart';
import 'package:provider/provider.dart';

import '../widgets/messsge_widget.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: themeNotifier.isDark
              ? Colors.grey.shade800
              : Colors.grey.shade200,
          elevation: 4,
          title: Text('Message',
              style: TextStyle(
                color: themeNotifier.isDark
                    ? Colors.grey.shade200
                    : Colors.grey.shade800,
              )),
          //centerTitle: true,
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
            color: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade800,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final MessageData = messageData[index];
            return MessageBox(messageModel: MessageData);
          },
          itemCount: messageData.length,
          shrinkWrap: true,
        ),
      );
    });
  }
}
