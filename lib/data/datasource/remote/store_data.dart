// import 'package:second/core/class/crud.dart';
// import 'package:second/data/model/store_model.dart';

// class StoreData {
//   Crud crud = Crud();

//   Future<List<StoreModel>> getStores(String areaId) async {
//     final responseEither = await crud
//         .getRequest("http://192.168.1.104:8050/api/stores/$areaId", {}, {});

//     return responseEither.fold(
//       (l) => [],
//       (r) {
//         List storesJson = r['stores'] ?? [];
//         return storesJson.map((e) => StoreModel.fromJson(e)).toList();
//       },
//     );
//   }
// }
