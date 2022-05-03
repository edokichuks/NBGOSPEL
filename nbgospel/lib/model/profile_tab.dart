import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileTab extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String imgURL;
  final Uri webURL;
  const ProfileTab({
    Key? key,
    required this.firstName,
    required this.imgURL,
    required this.webURL,
    required this.lastName,
  }) : super(key: key);
  Future<void> _lunchURL() async {
    //todo check this void return type it breaks the code
    if (await canLaunchUrl(webURL)) {
      if (!await launchUrl(
        webURL,
        mode: LaunchMode.inAppWebView,
      )) {
        print('inner statement ');
      }

      print('lauched url');
    } else {
      throw "Could not launch $webURL";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //todo check if gesture dector will bring error
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
                  imgURL,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 5),
            Text(
              firstName,
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(height: 5),
            Text(
              lastName,
              //todo check the error here or there
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
              ),
              //todo maybe add style
            ),
          ],
        ),
      ),
    );
  }
}
