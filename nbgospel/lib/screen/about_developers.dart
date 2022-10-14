import 'package:flutter/material.dart';
import 'package:nbgospel/theme_app/theme_app.dart';
import 'package:nbgospel/widgets/developer.dart';
import 'package:provider/provider.dart';

const Color mainColor = Color(0xffA67F61);

class AboutDevelopers extends StatefulWidget {
  const AboutDevelopers({Key? key}) : super(key: key);

  @override
  State<AboutDevelopers> createState() => _AboutDevelopersState();
}

class _AboutDevelopersState extends State<AboutDevelopers> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 3,
          leading: BackButton(
            color: themeNotifier.isDark
                ? Colors.grey.shade200
                : Colors.grey.shade800,
          ),
          title: const Text(
            'Developers',
            style: TextStyle(
              fontFamily: 'ChelaOne-Regular',
              fontSize: 40,
              color: mainColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: themeNotifier.isDark
              ? Colors.grey.shade800
              : Colors.grey.shade200,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 12,
                ),
                Developer(
                  width: width,
                  height: height,
                  imagePath: 'assets/pic.jpeg',
                  nickName: 'Jojocodes',
                  fullName: 'Osim Uka',
                  title: 'Flutter Apprentice Developer',
                  location: 'Owerri, Nigeria',
                  aboutText:
                      'More than 1+ years of experience in Flutter Development. I specialize in Mobile Development Projects',
                  emailLink: 'https://wa.me/message/EY6HEWG7RN33J1',
                  facebookLink: 'https://www.facebook.com/uka.osim.56',
                  linkedinLink:
                      'https://www.linkedin.com/in/osim-uka-9761601a0',
                  telegramLink: 'https://wa.me/message/EY6HEWG7RN33J1',
                  twitterLink:
                      'https://twitter.com/teamjojo_code?t=ead4UVzIshGt2NcMqSVVcQ&s=09',
                  whatappLink: 'https://wa.me/message/EY6HEWG7RN33J1',
                  isVisible1: false,
                  isVisible2: false,
                  skillAndTools1: 'assets/flutter.png',
                  skillAndTools2: 'assets/dart.png',
                  skillAndTools3: 'assets/Java.png',
                  skillAndTools4: 'assets/dart.png',
                  skillAndTools5: 'assets/dart.png',
                ),
                SizedBox(
                  height: height / 8,
                ),
                Developer(
                  width: width,
                  height: height,
                  imagePath: 'assets/chuksdev1.jpg',
                  nickName: 'chuksDev💙',
                  fullName: 'Edoki Chukwuyem',
                  title: 'Mobile App Developer',
                  location: 'Asaba, Nigeria',
                  aboutText:
                      'More than 1 year experience in fundamentals of programming in Java, C, Scripting language, design concepts, version control systems API consumption and lots more',
                  emailLink: 'https://wa.me/qr/KDHE2Y223QWCC1',
                  facebookLink: 'https://www.facebook.com/edoki.chukwuyem',
                  linkedinLink:
                      'https://www.linkedin.com/in/edoki-chukwuyem-659688220',
                  telegramLink: 'https://wa.me/qr/KDHE2Y223QWCC1',
                  twitterLink:
                      'https://twitter.com/chukscoDev?t=qtWAHpdbxY3TW5Y9b3Q_BA&s=09',
                  whatappLink: 'https://wa.me/qr/KDHE2Y223QWCC1',
                  isVisible1: true,
                  isVisible2: true,
                  skillAndTools1: 'assets/flutter.png',
                  skillAndTools2: 'assets/dart.png',
                  skillAndTools3: 'assets/Java.png',
                  skillAndTools4: 'assets/git logo.jpg',
                  skillAndTools5: 'assets/figma.png',
                ),
                SizedBox(
                  height: height / 12,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
