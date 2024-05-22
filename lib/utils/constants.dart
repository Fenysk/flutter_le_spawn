import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFF23F3A);
  static const Color secondary = Color(0xFFFDCF00);
  static const Color accent = Color(0xFF06B587);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

final theme = ThemeData(
  primaryColor: AppColors.primary,
  fontFamily: 'Acephimere',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.primary,
    selectedItemColor: AppColors.white,
    selectedIconTheme: IconThemeData(
      color: AppColors.white,
      shadows: [
        Shadow(
          color: AppColors.black,
          offset: Offset(0, 2),
        ),
      ],
    ),
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: AppColors.black,
          offset: Offset(0, 2),
        ),
      ],
    ),
    unselectedItemColor: AppColors.black,
    unselectedIconTheme: IconThemeData(
      color: AppColors.black,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontFamily: 'Grobold',
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Acephimere',
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Acephimere',
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.secondary,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.primary,
    actionsIconTheme: IconThemeData(
      color: AppColors.white,
      shadows: [
        Shadow(
          color: AppColors.black,
          offset: Offset(0, 2),
        ),
      ],
    ),
  ),
  cardTheme: const CardTheme(
    surfaceTintColor: AppColors.secondary,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.black,
    textColor: AppColors.black,
  ),
);
