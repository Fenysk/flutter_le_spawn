import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_spawn/utils/constants.dart';
import 'package:le_spawn/ui/screens/tab_screen.dart';

void main() {
  runApp(const LeSpawn());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ),
  );
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
      fontFamily: 'Grobold',
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Grobold',
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
);

class LeSpawn extends StatelessWidget {
  const LeSpawn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Spawn',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
    );
  }
}
