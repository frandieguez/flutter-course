import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromARGB(255, 200, 125, 249);
const secondaryColor = Color.fromARGB(255, 248, 150, 216);

const colorScheme = ColorScheme(
  primary: primaryColor,
  onPrimary: Colors.black,
  secondary: secondaryColor,
  onSecondary: Color(0xFFEAEAEA),
  error: Color(0xFFF32424),
  onError: Color(0xFFF32424),
  background: Colors.white,
  onBackground: Color(0xFFFFFFFF),
  surface: Colors.grey,
  onSurface: Colors.black,
  brightness: Brightness.light,
);

ThemeData appThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.secondary,
    foregroundColor: Colors.black,
    elevation: 4,
  ),
  colorScheme: colorScheme,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 40,
      letterSpacing: .5,
      color: Colors.black54,
    ),
    displaySmall: const TextStyle(
      fontSize: 15,
      letterSpacing: .5,
    ),
    titleLarge: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: GoogleFonts.montserrat(),
  ),
  useMaterial3: true,
);
