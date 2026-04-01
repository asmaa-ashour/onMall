// controller/theme_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String THEME_KEY = 'theme_mode';

  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedTheme = prefs.getBool(THEME_KEY);

    if (savedTheme != null) {
      isDarkMode.value = savedTheme;
      _applyTheme(savedTheme);
    }
  }

  void toggleTheme() async {
    isDarkMode.toggle();
    _applyTheme(isDarkMode.value);

    // حفظ الاختيار
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_KEY, isDarkMode.value);
  }

  void _applyTheme(bool darkMode) {
    Get.changeThemeMode(darkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
