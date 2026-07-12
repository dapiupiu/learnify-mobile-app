import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Mascot-Harmony Child-Friendly Color Palette
  static const Color primarySkyBlue = Color(0xFF4FB6EC); // Sky Blue Accent
  static const Color secondaryMascotOrange = Color(0xFFFFB067); // Secondary: Mascot Orange
  static const Color backgroundLightSkyBlue = Color(0xFFEBF5FF); // Background: Light Sky Blue
  static const Color surfaceWhite = Colors.white; // Surface: Solid White
  static const Color primaryTextNavy = Color(0xFF2C3E50); // Primary Text/Icons: Deep Navy Blue
  
  static const Color errorSoftRed = Color(0xFFF2D8D8);
  static const Color warningSoftYellow = Color(0xFFFBF4D5);
  static const Color successSoftGreen = Color(0xFFD4EDDA);

  static ThemeData get lightTheme {
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primarySkyBlue,
        secondary: secondaryMascotOrange,
        surface: surfaceWhite,
        onPrimary: Colors.white,
        onSecondary: primaryTextNavy,
        onSurface: primaryTextNavy,
      ),
      scaffoldBackgroundColor: backgroundLightSkyBlue,
      cardTheme: CardThemeData(
        color: surfaceWhite,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryTextNavy),
        titleTextStyle: TextStyle(
          color: primaryTextNavy,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
    );

    // Apply Quicksand font globally for a child-friendly rounded appearance in Deep Navy color
    return baseTheme.copyWith(
      textTheme: GoogleFonts.quicksandTextTheme(baseTheme.textTheme).copyWith(
        // H1 (32)
        headlineLarge: GoogleFonts.quicksand(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: primaryTextNavy,
        ),
        // H2 (24)
        headlineMedium: GoogleFonts.quicksand(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryTextNavy,
        ),
        // H3 (20)
        titleLarge: GoogleFonts.quicksand(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: primaryTextNavy,
        ),
        // Body (16)
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 16,
          color: primaryTextNavy,
        ),
        // Caption (14)
        bodyMedium: GoogleFonts.quicksand(
          fontSize: 14,
          color: primaryTextNavy.withValues(alpha: 0.8),
        ),
        bodySmall: GoogleFonts.quicksand(
          fontSize: 12,
          color: primaryTextNavy.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
