import 'storeModel.dart';

class FloorModel {
  final String title;
  final String image;
  final List<StoreModel> stores; // ✅ not nullable

  FloorModel({
    required this.title,
    required this.image,
    List<StoreModel>? stores,
  }) : stores = stores ?? []; // إذا null → خليها فارغة
}
