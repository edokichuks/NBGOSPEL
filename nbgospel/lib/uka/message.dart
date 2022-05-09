import 'package:flutter/material.dart';

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
      body: ListView(
        children: const [
          MessageBox(
            message: 'The Holy Spirit',
            url: 'assets/holy.png',
          ),
          MessageBox(
            message: 'Marriage and Relationship',
            url: 'assets/relationship.png',
          ),
          MessageBox(
            message: 'Prayer',
            url: 'assets/pray.png',
          ),
          MessageBox(
            message: 'Healing and Deliverance',
            url: 'assets/faith.png',
          ),
          MessageBox(
            message: 'Faith',
            url: 'assets/holy.png',
          ),
          MessageBox(
            message: 'Envangelism',
            url: 'assets/envangelism.png',
          ),
          MessageBox(
            message: 'Finance',
            url: 'assets/finance.png',
          ),
          MessageBox(
            message: 'Purpose, Destiny and Success',
            url: 'assets/holy.png',
          ),
          MessageBox(
            message: 'Inspirational Quotes',
            url: 'assets/purposes.png',
          ),
          MessageBox(
            message: 'Best Biographies',
            url: 'assets/finance.png',
          ),
          MessageBox(
            message: 'Best checkings',
            url: 'assets/finance.png',
          ),
        ],
      ),
    );
  }
}
