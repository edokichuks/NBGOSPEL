import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'main_home.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;

  final List<String> titles = [
    'Welcome',
    'Welcome',
    'Welcome',
  ];
  final List<String> subTitles = [
    'The fear of God is the beginning of wisdom',
    'Through wisdom comes understanding',
    'And understanding from the fear of God'
  ];
  final List<Color> colors = [
    Colors.grey.shade400,
    Colors.amber,
    Colors.brown.shade700,
  ];
  final List<String> quoteImg = [
    'assets/Quote1.jpg',
    'assets/Quote2.jpg',
    'assets/Quote3.jpg'
  ];
  SwiperController _controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: RectSwiperPaginationBuilder(
                activeColor: Colors.red,
                size: Size(10, 15),
                activeSize: Size(10, 25),
                color: Colors.grey.shade700,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                title: titles[index],
                bg: colors[index],
                subtitle: subTitles[index],
                imgUrl: quoteImg[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text('Skip'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return MainHome();
                    },
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
                  Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
              onPressed: () {
                if (_currentIndex != 2) {
                  _controller.next();
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return MainHome();
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String? subtitle; //todo check this line of code
  final Color? bg;
  final String imgUrl;

  IntroItem(
      {required this.title,
      required this.bg,
      required this.subtitle,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              if (subtitle != null) ...[
                SizedBox(height: 20),
                Text(
                  subtitle!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 70),
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Material(
                      elevation: 4,
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
