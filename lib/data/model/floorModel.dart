import 'package:second/data/model/area_model.dart';

class FloorModel {
  final String title;
  final String image;
  final List<AreaModel> stores;

  FloorModel({
    required this.title,
    required this.image,
    List<AreaModel>? stores,
  }) : stores = stores ?? [];

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
      title: json['title'] ?? '',
      image: json['image'] ?? 'assets/images/f1.jpg',
      stores: json['stores'] != null
          ? List<AreaModel>.from(
              (json['stores'] as List).map((e) => AreaModel.fromJson(e)))
          : [],
    );
  }
}
