import 'package:flutter/material.dart';

class AppColor {
  static const Color grey2 = Color(0xffBCBCBC);
  static const Color grey = Color.fromARGB(255, 160, 162, 164);
  static const Color prrimaryColor = const Color(0xff8B2C3A);
  static const Color secondColor = Color.fromARGB(255, 65, 114, 240);
  static const Color NotiColor = Color.fromARGB(33, 10, 10, 10);
  static const Color thirdColor = Color(0xff2B0F14);
  static const Color fourColor = Color(0xff40c4ffff);
  static const Color black = Color(0xffA0A21);

  static const Color primaryColor = Color(0xff8B5E3C); // اللون البرغندي/البني
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.white;
  static const Color greyText = Colors.grey;

  // لون التدرج - برغندي غامق في الأسفل يتحول لشفاف في الأعلى
  static LinearGradient overlayGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xff5D3A1F), // برغندي غامق جداً في الأسفل
      Color(0xaa8B5E3C), // برغندي متوسط مع شفافية
      Colors.transparent, // شفاف في الأعلى
    ],
    stops: [0.0, 0.5, 1.0], // توزيع الألوان
  );
}
