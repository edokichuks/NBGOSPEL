import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'main_home.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;

  final List<String> titles = [
    'Welcome',
    'Welcome',
  ];
  final List<String> subTitles = [
    'The fear of God is the beginning of wisdom',
    'Through wisdom comes understanding',
  ];
  final List<Color> colors = [
    Colors.grey.shade400,
    Colors.brown.shade400,
  ];
  final List<String> quoteImg = [
    'assets/Quote 2.jpg',
    'assets/Quote3.jpg',
  ];
  final SwiperController _controller = SwiperController();
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
                activeColor: Colors.deepOrange,
                size: const Size(10, 15),
                activeSize: const Size(10, 25),
                color: Colors.grey.shade900,
              ),
            ),
            itemCount: 2,
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
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const MainHome();
                    },
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                _currentIndex == 1 ? Icons.check : Icons.arrow_forward,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                if (_currentIndex != 1) {
                  _controller.next();
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const MainHome();
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
  final String? subtitle;
  final Color? bg;
  final String imgUrl;

  const IntroItem(
      {Key? key,
      required this.title,
      required this.bg,
      required this.subtitle,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
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
