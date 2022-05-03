import 'package:flutter/material.dart';
import 'package:nbgospel/model/profile_tab.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  int count = 20;
  final List<String> pic = [
    'assets/Apostle Arome Osayi.jpg',
    'assets/Apostle Edu Udechukwu.jpg',
    'assets/Apostle Johnson Suleman.jpg',
    'assets/Apostle Joshua Selman.jpg',
    'assets/Apostle Michael Orokpo.jpg',
    'assets/Bro Gbile Akanni.jpg',
    'assets/Dr John Akpami.jpg',
    'assets/Healing.jpg',
    'assets/Joel Osteen.jpg',
    'assets/P. Daneil.jpg',
    'assets/Pastor Chingtok Ishaku.jpg',
    'assets/Pastor Chris Devin.jpg',
    'assets/Pastor Chris Oyakhilome.jpg',
    'assets/Pastor David Ogbueli.jpg',
    'assets/Pastor Derick Prince.jpg',
    'assets/Pastor Femi Lazarus.jpg',
    'assets/Pastor Paul Enenche.jpg',
    'assets/Pastor W.F. Kumuyi.jpg',
    'assets/Prayer.jpg',
    'assets/Prophet Jesse Janfa.jpg',
    'assets/Reverend Gideon Odoma.jpg',
    'assets/Reverend Tolu Agboola.jpg',
    'assets/T.D. Jakes.jpg',
  ];
  final List<String> FirsName = [
    'Apostle Arome',
    'Apostle Edu',
    'Apostle Johnson',
    'Apostle Joshua',
    'Apostle Michael',
    'Bro Gbile',
    'Rev John',
    'Healing',
    'Pastor Joel',
    'Pastor Daniel',
    'Pastor Chingtok',
    'Pastor Chris',
    'Pastor Chris',
    'Pastor David',
    'Pastor Derick',
    'Pastor Femi',
    'Pastor Paul',
    'Pastor W.F.',
    'Prayer',
    'Prophet Jesse',
    'Reverend Gideon',
    'Reverend Tolu',
    'Bishop T.D.',
  ];
  final List<String> LastName = [
    'Osayi',
    'Udechukwu',
    'Suleman',
    'Selman',
    'Orokpo',
    'Akanni',
    'Akpami',
    '',
    'Osteen',
    'Olawande',
    'Ishaku',
    'Devin',
    'Oyakhilome',
    'Ogbueli',
    'Prince',
    'Lazarus',
    'Enenche',
    'Kumuyi',
    '',
    'Janfa',
    'Odoma',
    'Agboola',
    'Jakes',
  ];
  final List<String> url = [
    'https://nbgospel.com/download-apostle-arome-osayi-messages-2021/',
    'https://nbgospel.com/download-all-apostle-edu-udechukwu-messages/',
    'https://nbgospel.com/apostle-johnson-suleman-messages-2021-mp3/',
    'https://nbgospel.com/download-apostle-joshua-selman-messages/',
    'https://nbgospel.com/download-apostle-michael-orokpo-messages-mp3/',
    'https://nbgospel.com/download-bro-gbile-akanni-messages/',
    'https://nbgospel.com/reverend-john-akpami-messages/',
    'https://nbgospel.com/',
    'https://nbgospel.com/free-audio-download-joel-osteen-sermons/',
    'https://nbgospel.com/',
    'https://nbgospel.com/pastor-chingtok-ishaku-messages-mp3/',
    'https://nbgospel.com/',
    'https://nbgospel.com/download-pastor-chris-oyakhilome-messages/',
    'https://nbgospel.com/download-pastor-david-ogbueli-messages/',
    'https://nbgospel.com/download-derek-prince-sermons-audio-and-book-collections/',
    'https://nbgospel.com/download-pastor-femi-lazarus-messages/',
    'https://nbgospel.com/audio-of-dr-pastor-paul-enenche-messages-mp3/',
    'https://nbgospel.com/dlcm-download-pastor-wf-kumuyi-messages-2021-mp3/',
    'https://nbgospel.com/',
    'https://nbgospel.com/download-all-prophet-jesse-janfa-messages/',
    'https://nbgospel.com/recent-mp3-download-all-rev-gideon-odoma-messages-here/',
    'https://nbgospel.com/download-all-reverend-tolu-agboola-messages/',
    'https://nbgospel.com/download-t-d-jakes-sermons-and-books/',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // left: 10,
        // right: 10,
        top: 10,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: pic.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return ProfileTab(
            firstName: FirsName[index],
            lastName: LastName[index],
            imgURL: pic[index],
            webURL: Uri.parse(url[index]),
          );
        },
      ),
    );
  }
}
