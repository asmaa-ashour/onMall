class StoreModel {
  final String title;
  final String image;
  final String description;

  StoreModel({
    required this.title,
    required this.image,
    required this.description,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      title: json['title'] ?? '',
      image: json['image'] ?? 'assets/images/default.jpg',
      description: json['description'] ?? '',
    );
  }
}
