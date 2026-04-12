// lib/core/constants/app_constants.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryPurple = Color(0xff8B2C3A);
  static const Color secondaryPurple = Color(0xFFD4AF37);
  static const Color white = Colors.white;
  static const Color black87 = Colors.black87;
  static const Color grey = Colors.grey;
  static const Color thirdColor = Color(0xff2B0F14);
  static const List<Color> gradientColors = [
    primaryPurple,
    secondaryPurple,
  ];
}

class AppDimens {
  static const double small8 = 8.0;
  static const double verysmall4 = 4.0;
  static const double medium16 = 16.0;
  static const double medium14 = 14.0;
  static const double large24 = 24.0;
  static const double xLarge32 = 32.0;

  ///
  static const double verysmall = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  // static const double medium = 14.0;
  static const double large = 24.0;
  static const double xLarge = 32.0;

  static const double buttonHeight = 50.0;
  static const double imageSize = 200.0;
  static const double borderRadius = 20.0;

  /// 🔥 جديد
  static const double cardHeight = 280.0;
  static const double cardRadius = 20.0;
}

class AppTextStyles {
  static const TextStyle productName = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black87,
  );

  static const TextStyle productPrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryPurple,
  );

  static const TextStyle productDescription = TextStyle(
    fontSize: 14,
    color: AppColors.grey,
    height: 1.5,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: AppColors.white,
  );
}

class AppSizes {
  static const double icon = 24;
  static const double appBarTitle = 20;
}

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double scaleFactor = 1;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    scaleFactor = screenWidth / 375; // iPhone base
  }
}

extension Responsive on num {
  double get w => this * SizeConfig.scaleFactor;
}
