import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harrypotter/data/preferences.dart';
import 'package:harrypotter/screens/splash.dart';
import 'package:harrypotter/styles/app_styles.dart';
import 'package:provider/provider.dart';

import 'data/hogwarts_data.dart';

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
        ChangeNotifierProvider(create: (create) => HogwardsData()),
        ChangeNotifierProvider(create: (create) => Preferences()),
      ],
      // Instancia de la clase que gestiona los datos
      // Objetos que van a obtener los datos
      child: MaterialApp(
        title: 'Howards app',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppStyles.saffron),
            useMaterial3: true,
            fontFamily: 'montserrat',
            appBarTheme: const AppBarTheme(
                backgroundColor: AppStyles.saffron, centerTitle: true)),
        home: const Splash(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
