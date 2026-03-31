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
<<<<<<< HEAD
    Timer(Duration(seconds: 3), () {
=======
    Timer(const Duration(seconds: 3), () {
>>>>>>> origin/feature/store_and_product
      Get.offAllNamed(AppRoute.lang);
    });
  }

  // @override
  // changhThem() {
  //   if (Get.isDarkMode) {
  //     Get.changeTheme(Themes.customLightTheme);
  //     myServices.sharedPreferences.setString("theme", "light");
  //   } else {
  //     Get.changeTheme(Themes.customDarkTheme);
  //     myServices.sharedPreferences.setString("theme", "dark");
  //   }
  // }

  @override
  void onInit() {
    goToOnBoarding();
    super.onInit();
  }
}
