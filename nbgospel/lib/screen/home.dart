import 'package:flutter/material.dart';
import 'package:nbgospel/api/nbGospel_services.dart';
import 'package:nbgospel/model/simple_data.dart';
import 'package:nbgospel/screen/main_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final exploreService = NBGospelServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getMinister(),
        builder: (context, AsyncSnapshot<List<SimpleData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MainScreen();
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ));
          }
        });
  }
}
