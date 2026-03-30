// theme_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // تحميل الثيم المحفوظ
    loadTheme();
  }

  void loadTheme() {
    // ممكن تستخدم shared_preferences لحفظ الثيم
    isDarkMode.value = false; // افتراضي فاتح
  }

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    // حفظ الثيم في shared_preferences
  }

  void setLightMode() {
    isDarkMode.value = false;
    Get.changeThemeMode(ThemeMode.light);
  }

  void setDarkMode() {
    isDarkMode.value = true;
    Get.changeThemeMode(ThemeMode.dark);
  }

  void setSystemMode() {
    Get.changeThemeMode(ThemeMode.system);
    // تحديث isDarkMode حسب النظام
    isDarkMode.value =
        MediaQuery.of(Get.context!).platformBrightness == Brightness.dark;
  }
}
