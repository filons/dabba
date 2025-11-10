import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs principales
  static const Color primaryColor = Color(0xFF1B7989); // Bleu-vert apaisant
  static const Color secondaryColor = Color(0xFF43A7B5); // Bleu clair vivifiant
  static const Color accentColor = Color(0xFF4CAF94); // Vert d'eau

  // Variations de couleurs
  static const Color primaryLight = Color(
    0xFFE5F4F7,
  ); // Bleu très clair pour les fonds
  static const Color secondaryLight = Color(0xFFEDF8FA); // Bleu-vert très clair
  static const Color accentLight = Color(0xFFE8F5F2); // Vert d'eau très clair

  // Couleurs de fond
  static const Color backgroundColor = Colors.white;
  static const Color surfaceColor = Color(0xFFFAFAFA);

  // Couleurs de texte
  static const Color primaryText = Color(0xFF2D3436); // Gris foncé
  static const Color secondaryText = Color(0xFF636E72); // Gris moyen

  // Couleurs d'état
  static const Color success = Color(0xFF4CAF94); // Vert
  static const Color warning = Color(0xFFFFB74D); // Orange
  static const Color error = Color(0xFFFF7675); // Rouge doux
  static const Color info = Color(0xFF74B9FF); // Bleu clair

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceColor,
        background: backgroundColor,
        error: error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onSurface: primaryText,
        onBackground: primaryText,
        onError: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 2,
        shadowColor: primaryColor.withOpacity(0.1),
        foregroundColor: primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        iconTheme: IconThemeData(color: primaryColor, size: 24),
        actionsIconTheme: IconThemeData(color: primaryColor, size: 24),
        toolbarHeight: 70,
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardTheme: CardTheme(
        elevation: 2,
        shadowColor: primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: primaryColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: primaryText, fontSize: 16),
        bodyMedium: TextStyle(color: secondaryText, fontSize: 14),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surfaceColor,
        elevation: 2,
        shadowColor: primaryColor.withOpacity(0.1),
        height: 65,
        indicatorColor: primaryColor.withOpacity(0.12),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            );
          }
          return const TextStyle(fontSize: 13, color: secondaryText);
        }),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: primaryColor, size: 22);
          }
          return const IconThemeData(color: secondaryText, size: 22);
        }),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
