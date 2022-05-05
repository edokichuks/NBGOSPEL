import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final String message;
  final ImageIcon url;
  const MessageBox({Key? key, required this.message, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black,
      leading: ImageIcon(
        AssetImage('$url'),
        size: 10,
        color: Colors.white,
      ),
      title: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.all(10),
      hoverColor: Colors.grey,
      onTap: () {},
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.white,
      ),
    );
  }
}
