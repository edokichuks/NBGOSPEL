import 'package:flutter/material.dart';
import 'package:nbgospel/data_list.dart';
import 'package:nbgospel/model/model.dart';
import 'package:nbgospel/screen/screen.dart';
import '../theme_app/theme_app.dart';
import 'package:provider/provider.dart';

class MainHome extends StatefulWidget {
  const MainHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool isClicked = true;
  bool _isSearching = false;
  List<UserModel> _searchedUsers = [];
  late final TextEditingController _textEditingController;

  void _searchListener() {
    if (_textEditingController.text.trim().isNotEmpty) {
      String searchQuery = _textEditingController.text.trim().toLowerCase();

      List<UserModel> tempList = [];

      for (int i = 0; i < originalList.length; i++) {
        final singleItem = originalList[i];
        if (singleItem.fullName.toLowerCase().contains(searchQuery) ||
            singleItem.lastName.toLowerCase().contains(searchQuery)) {
          tempList.add(singleItem);
        }
      }

      setState(() {
        _searchedUsers = tempList;
        _isSearching = true;
      });
    } else {
      setState(() {
        _isSearching = false;
        isClicked = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_searchListener);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: isClicked
              ? const Text(
                  'NBGOSPEL',
                  style: TextStyle(
                    fontFamily: 'ChelaOne-Regular',
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                  ),
                )
              : Container(
                  height: 35,
                  color: themeNotifier.isDark
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _textEditingController,
                          cursorColor: themeNotifier.isDark
                              ? Colors.grey.shade200
                              : Colors.grey.shade800,
                          textInputAction: TextInputAction.none,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            hintText: 'Search on NBGospel',
                            icon: Icon(
                              Icons.search,
                              color: themeNotifier.isDark
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _textEditingController.clear();
                          setState(
                            () {
                              _textEditingController.text = '';
                            },
                          );

                          final currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        child: Center(
                          child: Icon(
                            Icons.close_rounded,
                            color: themeNotifier.isDark
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          centerTitle: true,
          backgroundColor:
              themeNotifier.isDark ? Colors.grey.shade900 : Colors.deepOrange,
          elevation: 0,
          actions: [
            Visibility(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isClicked = !isClicked;
                    if (_textEditingController.text.isNotEmpty) {
                      isClicked = true;
                    }
                  });
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              visible: isClicked,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                fontFamily: 'ChelaOne-Regular',
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return const General();
                        }));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.color_lens_outlined,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Change Theme',
                              style: TextStyle(
                                fontFamily: 'ChelaOne-Regular',
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return const AboutUs();
                        }));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.my_library_books_rounded,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'About Us',
                              style: TextStyle(
                                fontFamily: 'ChelaOne-Regular',
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                child: const Icon(
                  Icons.more_vert,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        drawer: const HomeDrawer(),
        body: _isSearching && _searchedUsers.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 100,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: !_isSearching
                    ? GridView.builder(
                        itemCount: originalList.length, //25
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          final user = originalList[index];
                          return ProfileTab(
                            user: user,
                          );
                        },
                      )
                    : GridView.builder(
                        itemCount: _searchedUsers.length, //25
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          final user = _searchedUsers[index];
                          return ProfileTab(
                            user: user,
                          );
                        },
                      ),
              ),
      );
    });
  }
}
