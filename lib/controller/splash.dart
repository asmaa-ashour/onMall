import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:second/core/constant/routs.dart';

abstract class LogoController extends GetxController {
  goToOnBoarding();
}

class LogoControllerImp extends LogoController {
  @override
  goToOnBoarding() {
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.onBoarding);
    });
  }

  @override
  void onInit() {
    goToOnBoarding();
    super.onInit();
  }
}
