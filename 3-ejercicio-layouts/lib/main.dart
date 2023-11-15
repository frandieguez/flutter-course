import 'package:ejercicio_layouts/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

const secondaryColor = Color.fromARGB(255, 200, 125, 249);
const primaryColor = Color.fromARGB(255, 248, 150, 216);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.montserrat(),
          displaySmall: const TextStyle(),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
