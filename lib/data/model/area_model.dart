class AreaModel {
  final String id;
  final String title;
  final String image;

  AreaModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      image: json['image'] ?? 'assets/images/default.jpg',
    );
  }
}
