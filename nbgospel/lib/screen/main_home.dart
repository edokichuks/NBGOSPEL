import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbgospel/data_list.dart';
import 'package:nbgospel/model/profile_tab.dart';
import 'package:nbgospel/model/user_model.dart';
import 'package:nbgospel/uka/aboutus.dart';
import 'package:nbgospel/uka/general.dart';
import 'package:nbgospel/uka/settings.dart';

import 'drawer.dart';

class MainHome extends StatefulWidget {
  const MainHome({
    Key? key,
  }) : super(key: key);
  final isSwitched = true;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  //toggle the NText
  bool isClicked = true;
  bool isSwitched = true; //todo yet undone
  bool _isSearching = false;
  List<UserModel> _searchedUsers = [];
  late final TextEditingController _textEditingController;

  void _searchListener() {
    if (_textEditingController.text.trim().isNotEmpty) {
      String searchQuery = _textEditingController.text.trim().toLowerCase();

      List<UserModel> tempList = [];

      for (int i = 0; i < originalList.length; i++) {
        final singleItem = originalList[i];
        if (singleItem.fullName.toLowerCase().contains(searchQuery)) {
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
    return Scaffold(
      appBar: AppBar(
        title: isClicked
            ? Text(
                'NBGOSPEL',
                style: TextStyle(
                  fontFamily: 'Signatra',
                  fontSize: 40,
                ),
              )
            : Container(
                height: 35,
                color: Colors.grey.shade600,
                //todo change this colors
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _textEditingController,
                        //autofocus: true,
                        cursorColor: Colors.grey.shade800,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintText: 'Search here on nbGospel',
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey.shade700,
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
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Visibility(
            visible: isClicked,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isClicked = !isClicked;
                });
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade700,
              ),
            ),
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
                          builder: (context) => Settings(),
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
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => General(),
                        ),
                      );
                    },
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
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return AboutUs();
                      }));
                    },
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
                ),
              ],
              child: Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: HomeDrawer(),
      body: _isSearching && _searchedUsers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 80,
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
  }
}
