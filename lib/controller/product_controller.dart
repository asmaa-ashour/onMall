// lib/controllers/product_controller.dart
import 'package:get/get.dart';
import 'package:second/data/model/product_model.dart';

class ProductController extends GetxController {
  final product = ProductModel.mock().obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  void buyProduct() {
    // منطق الشراء هنا
    print('Buying product: ${product.value.name}');
  }

  void loadProduct() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      // هنا يمكن جلب المنتج من API
      await Future.delayed(const Duration(seconds: 1)); // محاكاة تحميل

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
    }
  }
}
