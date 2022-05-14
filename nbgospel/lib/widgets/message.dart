import 'package:flutter/material.dart';
import 'package:nbgospel/message_list.dart';


import 'messsge_widget.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text('Message', style: TextStyle(color: Colors.white)),
        //centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
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
      // body: ListView(
      //   children: const [
      //    MessageBox(
      //       webURL:
      //           'https://nbgospel.com/download-audio-messages-on-the-holy-spirit/',
      //       message: 'The Holy Spirit',
      //       url: 'assets/holy.png',
      //     ),
      //     MessageBox(
      //       webURL: '##',
      //       message: 'Marriage and Relationship',
      //       url: 'assets/relationship.png',
      //     ),
      //     MessageBox(
      //       webURL:
      //           'https://nbgospel.com/download-audio-messages-on-prayer-and-spiritual-gifts/',
      //       message: 'Prayer',
      //       url: 'assets/pray.png',
      //     ),
      //     MessageBox(
      //       webURL: 'https://nbgospel.com/messages-on-healing-and-deliverance/',
      //       message: 'Healing and Deliverance',
      //       url: 'assets/faith.png',
      //     ),
      //     MessageBox(
      //       webURL: 'https://nbgospel.com/sermons-on-faith/',
      //       message: 'Faith',
      //       url: 'assets/holy.png',
      //     ),
      //     MessageBox(
      //       webURL: 'https://nbgospel.com/sermons-on-evangelism/',
      //       message: 'Envangelism and Soul Winning',
      //       url: 'assets/envangelism.png',
      //     ),
      //     MessageBox(
      //       webURL: 'https://nbgospel.com/messages-on-finance-and-wealth/',
      //       message: 'Finance and Prosperity',
      //       url: 'assets/finance.png',
      //     ),
      //     MessageBox(
      //       webURL: '##',
      //       message: 'Purpose, Destiny and Success',
      //       url: 'assets/holy.png',
      //     ),
      //     MessageBox(
      //       webURL:
      //           'https://nbgospel.com/short-inspirational-gospel-quotes-for-the-day/',
      //       message: 'Inspirational Quotes',
      //       url: 'assets/purposes.png',
      //     ),
      //     MessageBox(
      //       webURL:
      //           'https://nbgospel.com/read-best-biographies-of-all-times-here/',
      //       message: 'Best Biographies',
      //       url: 'assets/finance.png',
      //     ),
      //     MessageBox(
      //       webURL: '##',
      //       message: 'Best checkings',
      //       url: 'assets/finance.png',
      //     ),
      //   ],
      // ),
    );
  }
}
