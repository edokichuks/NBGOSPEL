import 'package:nbgospel/model/simple_data.dart';

class ExploreData {
  final List<SimpleData> mainMinisters;
  ExploreData({required this.mainMinisters});

  factory ExploreData.fromJson(Map<String, dynamic> json) {
    return ExploreData(mainMinisters: json['mainMinisters']);
  }
}
