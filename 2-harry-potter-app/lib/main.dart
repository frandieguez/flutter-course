import 'package:flutter/material.dart';
import 'package:harrypotter/data/howards_data.dart';
import 'package:harrypotter/data/preferences.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => HowardsData()),
        ChangeNotifierProvider(create: (create) => Preferences()),
      ],
      // Instancia de la clase que gestiona los datos
      // Objetos que van a obtener los datos
      child: MaterialApp(
        title: 'Howards app',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'montserrat',
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.purple.shade400,
                foregroundColor: Colors.white)),
        home: const CharacterList(),
      ),
    );
  }
}
