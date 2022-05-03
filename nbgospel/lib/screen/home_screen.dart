import 'package:flutter/material.dart';
import 'package:nbgospel/api/nbGospel_services.dart';
import 'package:nbgospel/model/home_grid.dart';
import 'package:nbgospel/model/simple_data.dart';

class HomeScreen extends StatelessWidget {
  final exploreService = NBGospelServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text('Home'),
        ),
        //todo: use clipRRa----Material----image.asset
        body: FutureBuilder(
          future: exploreService.getMinister(),
          builder: (context, AsyncSnapshot<List<SimpleData>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return HomeGrid(data: snapshot.data ?? []);
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ));
            }
          },
        ));
  }
}
