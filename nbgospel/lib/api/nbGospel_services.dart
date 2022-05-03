import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nbgospel/model/explore_data.dart';
import 'package:nbgospel/model/simple_data.dart';

class NBGospelServices {
  Future<ExploreData> getExploreData() async {
    final mainministers = await getMinister();
    return ExploreData(mainMinisters: mainministers);
  }

  Future<List<ExploreData>> _getMinister() async {
    await Future.delayed(
      Duration(microseconds: 300),
    );
    final dataString = await _loadAsset(
      'assets/sample_data/ministers.json',
    );

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['ministers'] != null) {
      final ministers = <ExploreData>[];
      json['ministers'].forEach((v) {
        ministers.add(ExploreData.fromJson(v));
      });
      return ministers;
    } else {
      return [];
    }
  }

  Future<List<SimpleData>> getMinister() async {
    await Future.delayed(Duration(milliseconds: 300));
    final dataString = await _loadAsset('assets/sample_data/ministers.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['ministers'] != null) {
      final ministers = <SimpleData>[];
      json['ministers'].forEach((v) {
        ministers.add(SimpleData.fromJson(v));
      });
      return ministers;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
