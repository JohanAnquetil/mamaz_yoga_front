import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color pinkColor = Color(0xFFFFDADF);
  static const Color lightGreyColor = Color(0xFFA6A6A6);
  static const Color redColor = Color(0xFFFF0045);
  static const Color goldColor = Color(0xFFE3B33B);
  static const Color darkGreyColor = Color(0xFF7A7A7A);

  static TextTheme textTheme = TextTheme(
    titleMedium: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF171717),
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF171717),
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF171717),
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF171717),
    ),
  );
  static ThemeData theme = ThemeData().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
    ),
    primaryColor: AppTheme.redColor,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.redColor),
      ),
      labelStyle: textTheme.bodyMedium,
    ),
  );
}
