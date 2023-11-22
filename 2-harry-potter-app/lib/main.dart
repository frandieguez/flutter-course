import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harrypotter/data/howards_data.dart';
import 'package:harrypotter/screens/character_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Instancia de la clase que gestiona los datos
      create: (BuildContext context) => HowardsData(),
      // Objetos que van a obtener los datos
      child: MaterialApp(
        title: 'Howards app',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.lato().fontFamily,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.purple.shade400,
                foregroundColor: Colors.white)),
        home: CharacterList(),
      ),
    );
  }
}
