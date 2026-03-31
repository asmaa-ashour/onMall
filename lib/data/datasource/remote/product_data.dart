// import 'package:second/core/class/crud.dart';
// import 'package:second/data/model/product_model.dart';

// class ProductData {
//   Crud crud = Crud();

//   Future<List<ProductModel>> getProducts(String areaId) async {
//     final responseEither = await crud
//         .getRequest("http://192.168.1.104:8050/api/products/$areaId", {}, {});

//     return responseEither.fold(
//       (l) => [],
//       (r) {
//         List productsJson = r['products'] ?? [];
//         return productsJson.map((e) => ProductModel.fromJson(e)).toList();
//       },
//     );
//   }
// }
