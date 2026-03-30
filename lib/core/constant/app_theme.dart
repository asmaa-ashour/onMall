// core/theme/app_themes.dart
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff6C63FF),
    scaffoldBackgroundColor: const Color(0xfff5f5f5),
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff8B85FF),
    scaffoldBackgroundColor: const Color(0xff121212),
    cardColor: const Color(0xff1E1E1E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
