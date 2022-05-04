import 'package:flutter/material.dart';
import 'package:nbgospel/model/main_screen_data.dart';

import 'drawer.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'NBGOSPEL',
          style: TextStyle(
            fontFamily: 'Signatra',
            fontSize: 40,
          ),
        ),
        // title: Center(
        //   child: Container(
        //     height: 40,
        //     color: Colors.grey.shade800,
        //     //todo change this colors
        //     child: TextField(
        //       decoration: InputDecoration(
        //         border: InputBorder.none,
        //         hintText: 'Search here on nbGospel',
        //         icon: Icon(Icons.search),
        //       ),
        //     ),
        //   ),
        // ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontFamily: 'Signatra',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.color_lens_outlined,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Change Theme',
                          style: TextStyle(
                            fontFamily: 'Signatra',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.my_library_books_rounded,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            fontFamily: 'Signatra',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              child: Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          )
        ],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(30),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       border: InputBorder.none,
        //       hintText: 'Search here on nbGospel',
        //       icon: Icon(Icons.search),
        //     ),
        //   ),
        // ),
      ),
      drawer: HomeDrawer(),
      body: MainScreen(),
    );
  }
}
