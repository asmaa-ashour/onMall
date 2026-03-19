class StoreModel {
  final String name;
  final String image;
  final List<StoreModel> stores; // ✅

  StoreModel({required this.name, required this.image, this.stores = const []});
}
