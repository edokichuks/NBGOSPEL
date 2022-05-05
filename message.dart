import 'package:nbgospel/message/messsge_widget.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Message', style: TextStyle(color: Colors.white)),
        //centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: const [
          MessageBox(
              message: 'The Holy Spirit',
              url: ImageIcon(AssetImage('images/holy.png'))),
          MessageBox(
              message: 'Marriage and Relationship',
              url: ImageIcon(AssetImage('images/relationship.png'))),
          MessageBox(
              message: 'Prayer', url: ImageIcon(AssetImage('images/pray.png'))),
          MessageBox(
              message: 'Healing and Deliverance',
              url: ImageIcon(AssetImage('images/faith.png'))),
          MessageBox(
              message: 'Faith', url: ImageIcon(AssetImage('images/holy.png'))),
          MessageBox(
              message: 'Envangelism',
              url: ImageIcon(AssetImage('images/envangelism.png'))),
          MessageBox(
              message: 'Finance',
              url: ImageIcon(AssetImage('images/finance.png'))),
          MessageBox(
              message: 'Purpose, Destiny and Success',
              url: ImageIcon(AssetImage('images/holy.png'))),
          MessageBox(
              message: 'Inspirational Quotes',
              url: ImageIcon(AssetImage('images/purposes.png'))),
          MessageBox(
              message: 'Best Biographies',
              url: ImageIcon(AssetImage('images/finance.png'))),
          MessageB(
              message: 'Best checkings',
              url: ImageIcon(AssetImage('images/finance.png'))),
        ],
      ),
    );
  }
}

class MessageB extends StatelessWidget {
  final String message;
  final ImageIcon url;
  const MessageB({Key? key, required this.message, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(
              AssetImage('$url'),
              size: 10,
              color: Colors.white,
            ),
            Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ],
        ));
  }
}
