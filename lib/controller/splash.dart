import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:second/core/constant/routs.dart';

abstract class LogoController extends GetxController {
  goToOnBoarding();
//  changhThem();
}

class LogoControllerImp extends LogoController {
  @override
  goToOnBoarding() {
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.home);
    });
  }

  @override
  void onInit() {
    goToOnBoarding();
    super.onInit();
  }
}
