import 'package:flutter/material.dart';

class TColors {
  TColors._(); // Private constructor to prevent instantiation

  // App Basic Colors
  static const Color primaryColor = Color(0xFF6200EE); // Purple
  static const Color secondaryColor = Color(0xFF03DAC6); // Teal
  static const Color accentColor = Color(0xFFBB86FC); // Light Purple

  // App Gradient Colors
  static const Gradient linearGradientColor = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: <Color>[
      Color(0xffff9a9e), // Light Pink
      Color(0xfffad0c4), // Light Peach
      Color(0xfffad0c4), // Light Peach
    ],
  );

  // App Text Colors
  static const Color textPrimaryColor = Color(0xFF000000); // Black
  static const Color textSecondaryColor = Color(0xFF757575); // Grey
  static const Color textAccentColor = Color(0xFFFFFFFF); // White

  // App Background Colors
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Grey
  static const Color cardColor = Color(0xFFFFFFFF); // White
  static const Color errorColor = Color(0xFFB00020); // Red

  // App Background Container Colors
  static const Color containerBackgroundColor = Color(0xFFFAFAFA); // Light Grey
  static const Color containerShadowColor = Color(
    0xFF000000,
  ); // Black with opacity
  static const Color containerBorderColor = Color(0xFFE0E0E0); // Light Grey

  // App Button Colors
  static const Color buttonPrimaryColor = Color(0xFF6200EE); // Purple
  static const Color buttonSecondaryColor = Color(0xFF03DAC6); // Teal
  static const Color buttonDisabledColor = Color(0xFFBDBDBD); // Grey

  // App Border Colors
  static const Color borderColor = Color(0xFFE0E0E0); // Light Grey
  static const Color borderFocusColor = Color(0xFF6200EE); // Purple

  // Error and Validation Colors
  static const Color errorTextColor = Color(0xFFB00020); // Red
  static const Color warningTextColor = Color(0xFFFFA000); // Amber
  static const Color successTextColor = Color(0xFF388E3C); // Green
  static const Color infoTextColor = Color(0xFF1976D2); // Blue

  // App Neutral Shades
  static const Color black = Color(0xFF000000); // Black
  static const Color white = Color(0xFFFFFFFF); // White
  static const Color grey = Color(0xFF757575); // Grey
  static const Color lightGrey = Color(0xFFBDBDBD); // Light Grey
  static const Color darkGrey = Color(0xFF424242); // Dark Grey
  static const Color softGrey = Color(0xFF9E9E9E); // Soft Grey
}
