import 'package:get/get.dart';
// import 'package:second/controller/products_controller.dart';
// import 'package:second/controller/stores_controller.dart';
// import 'package:second/repositories/product_repository.dart';
// import 'package:second/repositories/store_repository.dart';
// import 'package:second/services/api_service.dart';
import '../core/class/crud.dart';

/*
class InitialBindings extends Bindings {
  InitialBindings(
    Null Function() param0,
  );
  @override
  void dependencies() {
    Get.put(Crud());
  }
}*/
class InitialBindings extends Bindings {
  InitialBindings();
  @override
  void dependencies() {
    Get.put(Crud());

    // // Services
    // Get.put<ApiService>(ApiService(), permanent: true);

    // // Repositories
    // Get.put<StoreRepository>(StoreRepositoryImpl(), permanent: true);
    // Get.put<StoresController>(StoresController(), permanent: true);

    // Get.put<ProductRepository>(ProductRepositoryImpl(), permanent: true);
    // // Get.put<ProductRepository>RepositoryImpl(), permanent: true);

    // // Controllers
    // Get.put<StoresController>(StoresController(), permanent: true);
    // Get.put<ProductsController>(ProductsController(), permanent: true);
  }
}
