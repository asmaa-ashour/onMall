// lib/core/constants/app_constants.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryPurple = Color(0xFF8E2DE2);
  static const Color secondaryPurple = Color(0xFF4A00E0);
  static const Color white = Colors.white;
  static const Color black87 = Colors.black87;
  static const Color grey = Colors.grey;

  static const List<Color> gradientColors = [
    primaryPurple,
    secondaryPurple,
  ];
}

class AppDimens {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xLarge = 32.0;

  static const double buttonHeight = 50.0;
  static const double imageSize = 200.0;
  static const double borderRadius = 20.0;
}

class AppTextStyles {
  static const TextStyle productName = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black87,
  );

  static const TextStyle productPrice = TextStyle(
    fontSize: 24,
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
