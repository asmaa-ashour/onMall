// import 'package:get/get.dart';
// import 'package:second/data/datasource/remote/product_data.dart';
// import '../core/class/status_request.dart';
// import '../data/model/product_model.dart';

// class ProductController extends GetxController {
//   final String areaId;
//   ProductController(this.areaId);

//   List<ProductModel> products = [];
//   StatusRequest statusRequest = StatusRequest.loading;

//   @override
//   void onInit() {
//     super.onInit();
//     getProducts();
//   }

//   getProducts() async {
//     statusRequest = StatusRequest.loading;
//     update();

//     try {
//       final data = await ProductData().getProducts(areaId);
//       if (data.isNotEmpty) {
//         products = data;
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
