import 'package:flutter/material.dart';
import 'package:nbgospel/model/simple_data.dart';

class DataThumbnail extends StatelessWidget {
  final SimpleData Data;
  DataThumbnail({required this.Data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                '${Data.imageURL}',
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${Data.name}',
            //todo: add style here:
          )
        ],
      ),
    );
  }
}
