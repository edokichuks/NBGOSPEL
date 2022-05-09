import 'package:flutter/material.dart';
import 'package:nbgospel/data_list.dart';
import 'package:nbgospel/model/profile_tab.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: originalList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final user = originalList[index];
          return ProfileTab(
            user: user,
          );
        },
      ),
    );
  }
}
