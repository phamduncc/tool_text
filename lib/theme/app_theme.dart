import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary color palette
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF5A52D5);
  static const Color primaryLight = Color(0xFF8B83FF);

  // Accent colors
  static const Color accent = Color(0xFF00D2FF);
  static const Color accentSecondary = Color(0xFFFF6B9D);

  // Background colors
  static const Color backgroundDark = Color(0xFF0F0E17);
  static const Color surfaceDark = Color(0xFF1A1A2E);
  static const Color cardDark = Color(0xFF16213E);

  // Text colors
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB0B0C3);
  static const Color textMuted = Color(0xFF6B6B80);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF00D2FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Surface colors for light mode
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF4A4A4A);
  static const Color textMutedLight = Color(0xFF8E8E93);

  // Tool card gradients - unique for each tool
  static const List<LinearGradient> toolGradients = [
    LinearGradient(colors: [Color(0xFF6C63FF), Color(0xFF5A52D5)]),
    LinearGradient(colors: [Color(0xFF00D2FF), Color(0xFF0097B2)]),
    LinearGradient(colors: [Color(0xFFFF6B9D), Color(0xFFCC5580)]),
    LinearGradient(colors: [Color(0xFF4ECDC4), Color(0xFF3BA89F)]),
    LinearGradient(colors: [Color(0xFFFF8A65), Color(0xFFCC6E51)]),
    LinearGradient(colors: [Color(0xFFAB47BC), Color(0xFF8E24AA)]),
    LinearGradient(colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)]),
    LinearGradient(colors: [Color(0xFF66BB6A), Color(0xFF43A047)]),
    LinearGradient(colors: [Color(0xFFFFCA28), Color(0xFFFFA000)]),
    LinearGradient(colors: [Color(0xFFEF5350), Color(0xFFE53935)]),
    LinearGradient(colors: [Color(0xFF26C6DA), Color(0xFF00ACC1)]),
  ];

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: accent,
      surface: surfaceLight,
      error: Color(0xFFD32F2F),
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
      headlineLarge: GoogleFonts.outfit(
        color: textPrimaryLight,
        fontSize: 28,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
      titleLarge: GoogleFonts.outfit(
        color: textPrimaryLight,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.inter(
        color: textPrimaryLight,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.inter(
        color: textPrimaryLight,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.inter(
        color: textSecondaryLight,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.inter(
        color: textMutedLight,
        fontSize: 12,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: textPrimaryLight),
      titleTextStyle: GoogleFonts.outfit(
        color: textPrimaryLight,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    cardTheme: CardThemeData(
      color: cardLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.withOpacity(0.1)),
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: accent,
      surface: surfaceDark,
      error: Color(0xFFEF5350),
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      headlineLarge: GoogleFonts.outfit(
        color: textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
      titleLarge: GoogleFonts.outfit(
        color: textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.inter(
        color: textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.inter(
        color: textPrimary,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.inter(
        color: textSecondary,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.inter(
        color: textMuted,
        fontSize: 12,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      elevation: 0,
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      iconTheme: const IconThemeData(color: textPrimary),
    ),
    cardTheme: CardThemeData(
      color: surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      hintStyle: GoogleFonts.inter(color: textMuted, fontSize: 14),
      contentPadding: const EdgeInsets.all(16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
