import 'package:flutter/material.dart';
import 'package:nbgospel/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileTab extends StatefulWidget {
  final UserModel user;
  const ProfileTab({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Future<void> _lunchURL() async {
    final webParse = Uri.parse(widget.user.url);
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
    return GestureDetector(
      onTap: _lunchURL,
      child: Container(
        height: 50,
        width: 50,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.asset(
                  widget.user.pic,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.user.firstName,
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.user.lastName,
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
