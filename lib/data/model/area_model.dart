import 'dart:ui';

class AreaModel {
  final String name;
  final String imageUrl;
  final bool isImageLeft;
  final List<Color> gradientColors;

  AreaModel({
    required this.name,
    required this.imageUrl,
    required this.isImageLeft,
    required this.gradientColors,
  });

  // من JSON
  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      isImageLeft: json['isImageLeft'],
      gradientColors: (json['gradientColors'] as List)
          .map((color) => Color(color))
          .toList(),
    );
  }

  // إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'isImageLeft': isImageLeft,
      'gradientColors': gradientColors.map((e) => e.value).toList(),
    };
  }
}
