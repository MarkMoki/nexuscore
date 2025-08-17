import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0A0A12);
  static const accent = Color(0xFF00FFE0);
  static const urgent = Color(0xFFFF2A6D);
  static const card = Color(0x1AFFFFFF);
}

ThemeData buildTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.accent,
      secondary: AppColors.accent,
      error: AppColors.urgent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.black,
    ),
    cardColor: AppColors.card,
  );
}