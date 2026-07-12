import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Pastel Color Palette (PRD Section 15)
  static const Color primaryPastelBlue = Color(0xFF6C93CD); // Primary: Pastel Blue
  static const Color secondaryPastelGreen = Color(0xFFB0D9B1); // Secondary: Pastel Green
  static const Color accentPastelOrange = Color(0xFFF9D9C3); // Accent: Pastel Orange
  
  static const Color backgroundWhite = Color(0xFFFFFFFF); // Background: White
  static const Color surfaceLightGray = Color(0xFFF5F7F8); // Surface: Light Gray
  
  static const Color errorSoftRed = Color(0xFFF2D8D8);
  static const Color warningSoftYellow = Color(0xFFFBF4D5);
  static const Color successSoftGreen = Color(0xFFD4EDDA);

  static ThemeData get lightTheme {
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryPastelBlue,
        secondary: secondaryPastelGreen,
        tertiary: accentPastelOrange,
        surface: surfaceLightGray,
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: backgroundWhite,
      cardTheme: CardThemeData(
        color: surfaceLightGray,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme).copyWith(
        // H1 (32)
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        // H2 (24)
        headlineMedium: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        // H3 (20)
        titleLarge: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        // Body (16)
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black87,
        ),
        // Caption (14)
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}
