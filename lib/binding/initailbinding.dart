import 'package:get/get.dart';
import 'package:second/controller/home/homeController.dart';

import '../core/class/crud.dart';

class InitialBindings extends Bindings {
  InitialBindings();
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(FloorController());
  }
}
