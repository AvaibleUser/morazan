import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromRGBO(3, 7, 21, 1),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(154, 197, 244, 1), // surface
      selectedItemColor: Colors.black87, // onPrimary
      unselectedItemColor: Colors.white, // background
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Colors.white,
      primary: const Color.fromRGBO(153, 219, 245, 1),
      secondary: const Color.fromRGBO(167, 236, 238, 1),
      tertiary: const Color.fromRGBO(255, 238, 187, 1),
      surface: const Color.fromRGBO(154, 197, 244, 1),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onTertiary: Colors.black,
      onSurface: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromRGBO(3, 7, 21, 1),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(7, 15, 43, 1), // surface
      selectedItemColor: Colors.white, // onPrimary
      unselectedItemColor: Color.fromRGBO(146, 144, 195, 1), // tertiary
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      background: const Color.fromRGBO(3, 7, 21, 1),
      primary: const Color.fromRGBO(27, 26, 85, 1),
      secondary: const Color.fromRGBO(83, 92, 145, 1),
      tertiary: const Color.fromRGBO(146, 144, 195, 1),
      surface: const Color.fromRGBO(7, 15, 43, 1),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.black,
      onSurface: Colors.white,
    ),
  );
}
