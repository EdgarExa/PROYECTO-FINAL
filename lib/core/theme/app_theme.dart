import 'package:flutter/material.dart';

class AppTheme {
  static const Color ink = Color(0xFF243247);
  static const Color muted = Color(0xFF66758A);
  static const Color background = Color(0xFFF5F7FA);
  static const Color primary = Color(0xFF496A81);
  static const Color accent = Color(0xFFDCE9E8);
  static const Color surface = Colors.white;

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
          secondary: const Color(0xFF7C9D9A),
          surface: surface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: ink),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: ink),
          titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: ink),
          bodyMedium: TextStyle(fontSize: 14, height: 1.45, color: ink),
          bodySmall: TextStyle(fontSize: 12, height: 1.4, color: muted),
        ),
        cardTheme: CardThemeData(
          color: surface,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surface,
          hintStyle: const TextStyle(color: muted),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      );
}
