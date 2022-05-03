import 'package:flutter/material.dart';
import 'package:nbgospel/model/simple_data.dart';

import 'data_thumbnail.dart';

class HomeGrid extends StatelessWidget {
  final List<SimpleData> data;

  HomeGrid({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 9, //todo data.length,
        itemBuilder: (context, index) {
          final simpleData = data[index];
          return DataThumbnail(Data: simpleData);
        },
      ),
    );
  }
}
