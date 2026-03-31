// import 'package:get/get.dart';
// import 'package:second/data/datasource/remote/store_data.dart';
// import '../core/class/status_request.dart';
// import '../data/model/store_model.dart';

// class StoreController extends GetxController {
//   final String areaId;
//   StoreController(this.areaId);

//   List<StoreModel> stores = [];
//   StatusRequest statusRequest = StatusRequest.loading;

//   @override
//   void onInit() {
//     super.onInit();
//     getStores();
//   }

//   getStores() async {
//     statusRequest = StatusRequest.loading;
//     update();

//     try {
//       final data = await StoreData().getStores(areaId);
//       if (data.isNotEmpty) {
//         stores = data;
//         statusRequest = StatusRequest.success;
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     } catch (e) {
//       statusRequest = StatusRequest.failure;
//     }
//     update();
//   }
// }
