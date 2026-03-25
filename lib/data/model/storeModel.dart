class StoresModel {
  final String name;
  final String image;
  final List<StoresModel> stores; // ✅

  StoresModel(
      {required this.name, required this.image, this.stores = const []});
}
