import 'package:get/get.dart';

class MainController extends GetxController {
  // Reactive variable للـ index الحالي
  var currentIndex = 0.obs;

  // دالة تغيير التبويب
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
