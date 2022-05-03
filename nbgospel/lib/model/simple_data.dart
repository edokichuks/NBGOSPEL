class SimpleData {
  String name;
  String imageURL;

  SimpleData({
    required this.name,
    required this.imageURL,
  });

  factory SimpleData.fromJson(Map<String, dynamic> json) {
    return SimpleData(
      name: json['name'] as String,
      imageURL: json['imageURL'] as String,
    );
  }
}
